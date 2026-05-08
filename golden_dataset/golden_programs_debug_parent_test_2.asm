; DESCRIPTION: Render a colored object at the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r4, 1
LDI r30, 0xFD00

; Clear screen
LDI r2, 0x101820
FILL r2

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r4, 10
LDI r14, 10
LDI r1, 0x1000
LDI r5, 0x00FF00
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r4, 10
LDI r14, 30
LDI r1, 0x2000
LDI r5, 0xFFFFFF
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12

; Wait a bunch of frames for child to set up its debug stub
LDI r3, 60
wait_init:
    FRAME
    SUBI r3, 1
    CMPI r3, 0
    JNZ r2, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r4, 10
LDI r14, 50
CMPI r2, 0
JNZ r2, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r1, 0x2100
LDI r5, 0xFFFF00
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12

; ── Send PING command ──
LDI r2, 3
LDI r20, 0x0C03
STORE r20, r2         ; COMMAND = 3 (ping)
LDI r2, 1
LDI r20, 0x0C04
STORE r20, r2         ; STATUS = 1 (pending)

; Wait for response
LDI r7, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r2, ping_got
    SUBI r7, 1
    CMPI r7, 0
    JNZ r2, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r4, 10
LDI r14, 70
LDI r1, 0x2200
LDI r5, 0xFF4444
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12
JMP done

ping_got:
; Clear status
LDI r2, 0
LDI r20, 0x0C04
STORE r20, r2

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r4, 10
LDI r14, 70
CMPI r2, 0
JNZ r2, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r1, 0x2200
LDI r5, 0x44FF44
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12

; ── Now test REGS ──
LDI r2, 1
LDI r20, 0x0C03
STORE r20, r2
LDI r2, 1
LDI r20, 0x0C04
STORE r20, r2

LDI r7, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r2, regs_got
    SUBI r7, 1
    CMPI r7, 0
    JNZ r2, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r2, 0
LDI r20, 0x0C04
STORE r20, r2

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r4, 10
LDI r14, 90
LDI r1, 0x2300
LDI r5, 0x4488FF
LDI r12, 0x101820
DRAWTEXT r4, r14, r1, r5, r12

done:
FRAME
JMP done
