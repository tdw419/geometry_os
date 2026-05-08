; DESCRIPTION: A colored object centered at the screen with fixed size.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r5, 1
LDI r30, 0xFD00

; Clear screen
LDI r0, 0x101820
FILL r0

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r5, 10
LDI r11, 10
LDI r10, 0x1000
LDI r12, 0x00FF00
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r5, 10
LDI r11, 30
LDI r10, 0x2000
LDI r12, 0xFFFFFF
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1

; Wait a bunch of frames for child to set up its debug stub
LDI r6, 60
wait_init:
    FRAME
    SUBI r6, 1
    CMPI r6, 0
    JNZ r0, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r5, 10
LDI r11, 50
CMPI r0, 0
JNZ r0, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r10, 0x2100
LDI r12, 0xFFFF00
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1

; ── Send PING command ──
LDI r0, 3
LDI r20, 0x0C03
STORE r20, r0         ; COMMAND = 3 (ping)
LDI r0, 1
LDI r20, 0x0C04
STORE r20, r0         ; STATUS = 1 (pending)

; Wait for response
LDI r3, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r0, ping_got
    SUBI r3, 1
    CMPI r3, 0
    JNZ r0, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r5, 10
LDI r11, 70
LDI r10, 0x2200
LDI r12, 0xFF4444
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1
JMP done

ping_got:
; Clear status
LDI r0, 0
LDI r20, 0x0C04
STORE r20, r0

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r5, 10
LDI r11, 70
CMPI r0, 0
JNZ r0, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r10, 0x2200
LDI r12, 0x44FF44
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1

; ── Now test REGS ──
LDI r0, 1
LDI r20, 0x0C03
STORE r20, r0
LDI r0, 1
LDI r20, 0x0C04
STORE r20, r0

LDI r3, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r0, regs_got
    SUBI r3, 1
    CMPI r3, 0
    JNZ r0, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r0, 0
LDI r20, 0x0C04
STORE r20, r0

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r5, 10
LDI r11, 90
LDI r10, 0x2300
LDI r12, 0x4488FF
LDI r1, 0x101820
DRAWTEXT r5, r11, r10, r12, r1

done:
FRAME
JMP done
