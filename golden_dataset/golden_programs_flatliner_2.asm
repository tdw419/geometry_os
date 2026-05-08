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

LDI r10, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r6, 0x2A0A0A
FILL r6

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r10, 10
LDI r2, 10
LDI r7, 0x1000
LDI r3, 0xFF0000
LDI r1, 0x2A0A0A
DRAWTEXT r10, r2, r7, r3, r1

; Initialize debug mailbox
LDI r6, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r6

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r6

LDI r6, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r6

; Counter: update heartbeat 5 times then crash
LDI r1, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r6, r20
    ADDI r6, 1
    STORE r20, r6

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r6, beat_loop
    STORE r20, r6

    ; Decrement counter
    SUBI r1, 1
    CMPI r1, 0
    JZ r6, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r6, 0xFF0000
    LDI r10, 50
    LDI r2, 50
    LDI r7, 50
    LDI r3, 50
    RECTF r10, r2, r7, r3, r6

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
