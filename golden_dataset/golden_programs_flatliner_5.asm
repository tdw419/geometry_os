; DESCRIPTION: The GeOS assembly code simulates a crash by initializing a debug mailbox, updating its heartbeat five times, and then halting execution to draw a red 'X' on the screen, effectively stopping further updates. This is used to test the watchdog/recovery system.

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

LDI r0, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r15, 0x2A0A0A
FILL r15

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r0, 10
LDI r1, 10
LDI r6, 0x1000
LDI r11, 0xFF0000
LDI r10, 0x2A0A0A
DRAWTEXT r0, r1, r6, r11, r10

; Initialize debug mailbox
LDI r15, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r15

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r15

LDI r15, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r15

; Counter: update heartbeat 5 times then crash
LDI r10, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r15, r20
    ADDI r15, 1
    STORE r20, r15

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r15, beat_loop
    STORE r20, r15

    ; Decrement counter
    SUBI r10, 1
    CMPI r10, 0
    JZ r15, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r15, 0xFF0000
    LDI r0, 50
    LDI r1, 50
    LDI r6, 50
    LDI r11, 50
    RECTF r0, r1, r6, r11, r15

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
