; DESCRIPTION: Display a object using color colored at the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r14, 1
LDI r30, 0xFD00

; Clear screen
LDI r1, 0x101820
FILL r1

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r14, 10
LDI r5, 10
LDI r6, 0x1000
LDI r4, 0x00FF00
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r14, 10
LDI r5, 30
LDI r6, 0x2000
LDI r4, 0xFFFFFF
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10

; Wait a bunch of frames for child to set up its debug stub
LDI r15, 60
wait_init:
    FRAME
    SUBI r15, 1
    CMPI r15, 0
    JNZ r1, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r14, 10
LDI r5, 50
CMPI r1, 0
JNZ r1, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r6, 0x2100
LDI r4, 0xFFFF00
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10

; ── Send PING command ──
LDI r1, 3
LDI r20, 0x0C03
STORE r20, r1         ; COMMAND = 3 (ping)
LDI r1, 1
LDI r20, 0x0C04
STORE r20, r1         ; STATUS = 1 (pending)

; Wait for response
LDI r2, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r1, ping_got
    SUBI r2, 1
    CMPI r2, 0
    JNZ r1, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r14, 10
LDI r5, 70
LDI r6, 0x2200
LDI r4, 0xFF4444
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10
JMP done

ping_got:
; Clear status
LDI r1, 0
LDI r20, 0x0C04
STORE r20, r1

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r14, 10
LDI r5, 70
CMPI r1, 0
JNZ r1, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r6, 0x2200
LDI r4, 0x44FF44
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10

; ── Now test REGS ──
LDI r1, 1
LDI r20, 0x0C03
STORE r20, r1
LDI r1, 1
LDI r20, 0x0C04
STORE r20, r1

LDI r2, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r1, regs_got
    SUBI r2, 1
    CMPI r2, 0
    JNZ r1, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r1, 0
LDI r20, 0x0C04
STORE r20, r1

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r14, 10
LDI r5, 90
LDI r6, 0x2300
LDI r4, 0x4488FF
LDI r10, 0x101820
DRAWTEXT r14, r5, r6, r4, r10

done:
FRAME
JMP done
