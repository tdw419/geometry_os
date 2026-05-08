; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r9, 1
LDI r30, 0xFD00

; Clear screen
LDI r4, 0x101820
FILL r4

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r9, 10
LDI r1, 10
LDI r3, 0x1000
LDI r14, 0x00FF00
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r9, 10
LDI r1, 30
LDI r3, 0x2000
LDI r14, 0xFFFFFF
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2

; Wait a bunch of frames for child to set up its debug stub
LDI r11, 60
wait_init:
    FRAME
    SUBI r11, 1
    CMPI r11, 0
    JNZ r4, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r9, 10
LDI r1, 50
CMPI r4, 0
JNZ r4, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r3, 0x2100
LDI r14, 0xFFFF00
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2

; ── Send PING command ──
LDI r4, 3
LDI r20, 0x0C03
STORE r20, r4         ; COMMAND = 3 (ping)
LDI r4, 1
LDI r20, 0x0C04
STORE r20, r4         ; STATUS = 1 (pending)

; Wait for response
LDI r8, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r4, ping_got
    SUBI r8, 1
    CMPI r8, 0
    JNZ r4, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r9, 10
LDI r1, 70
LDI r3, 0x2200
LDI r14, 0xFF4444
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2
JMP done

ping_got:
; Clear status
LDI r4, 0
LDI r20, 0x0C04
STORE r20, r4

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r9, 10
LDI r1, 70
CMPI r4, 0
JNZ r4, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r3, 0x2200
LDI r14, 0x44FF44
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2

; ── Now test REGS ──
LDI r4, 1
LDI r20, 0x0C03
STORE r20, r4
LDI r4, 1
LDI r20, 0x0C04
STORE r20, r4

LDI r8, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r4, regs_got
    SUBI r8, 1
    CMPI r8, 0
    JNZ r4, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r4, 0
LDI r20, 0x0C04
STORE r20, r4

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r9, 10
LDI r1, 90
LDI r3, 0x2300
LDI r14, 0x4488FF
LDI r2, 0x101820
DRAWTEXT r9, r1, r3, r14, r2

done:
FRAME
JMP done
