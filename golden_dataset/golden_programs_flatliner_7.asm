; DESCRIPTION: Display a object using color red at the screen.

; flatliner.asm -- Test program that simulates a crash
;
; Updates heartbeat 5 times, then stops.
; Used to test the watchdog/recovery system.
;
; Page 3 Debug Mailbox:
;   0x0C00: DEBUG_MAGIC (0xDB9900)
;   0x0C02: DEBUG_CHILD_PID
;   0x0C27: DEBUG_HEARTBEAT
;   0x0C28: DEBUG_CHECKPOINT

#define DEBUG_MAGIC      0x0C00
#define DEBUG_CHILD_PID  0x0C02
#define DEBUG_HEARTBEAT  0x0C27
#define DEBUG_CHECKPOINT 0x0C28

LDI r14, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r2, 0x2A0A0A
FILL r2

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r14, 10
LDI r7, 10
LDI r13, 0x1000
LDI r12, 0xFF0000
LDI r1, 0x2A0A0A
DRAWTEXT r14, r7, r13, r12, r1

; Initialize debug mailbox
LDI r2, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r2

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r2

LDI r2, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r2

; Counter: update heartbeat 5 times then crash
LDI r1, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r2, r20
    ADDI r2, 1
    STORE r20, r2

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r2, beat_loop
    STORE r20, r2

    ; Decrement counter
    SUBI r1, 1
    CMPI r1, 0
    JZ r2, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r2, 0xFF0000
    LDI r14, 50
    LDI r7, 50
    LDI r13, 50
    LDI r12, 50
    RECTF r14, r7, r13, r12, r2

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
