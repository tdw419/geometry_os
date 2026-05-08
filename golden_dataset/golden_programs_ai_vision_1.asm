; DESCRIPTION: The assembly code demonstrates the AI Vision Bridge functionality by drawing red bars on the screen, taking a checksum of the initial state, modifying the screen with a blue square, taking another checksum after modification, and making a mock call to the vision API with the prompt "desc". The program uses specific opcodes and registers to handle these tasks.

; ai_vision.asm -- Phase 88: AI Vision Bridge demo
;
; Demonstrates the AI_AGENT opcode:
;   op=0: screenshot to VFS file
;   op=1: canvas checksum
;   op=3: vision API call (with mock response)
;
; The program draws red bars, takes a checksum,
; modifies the screen, takes another checksum, and calls the vision API.

; ── Draw red bars ──
LDI r5, 1
LDI r11, 0xFF0000   ; red
LDI r2, 0          ; y = 0
LDI r3, 256        ; screen width
LDI r10, 32         ; bar spacing

draw_loop:
  LDI r12, 0        ; x = 0
  draw_row:
    PSET r12, r2, r11
    ADD r12, r5     ; x++
    CMP r12, r3
    BLT r13, draw_row
  ADD r2, r5       ; y++
  CMP r2, r10
  BLT r13, draw_loop

; ── Get checksum before (op=1) ──
LDI r6, 1
AI_AGENT r6       ; r13 = checksum
MOV r14, r13        ; save in r14

; ── Modify screen -- blue square ──
LDI r11, 0x0000FF   ; blue
LDI r2, 100
LDI r10, 156

fill_y:
  LDI r12, 100
  fill_x:
    PSET r12, r2, r11
    ADD r12, r5
    CMP r12, r10
    BLT r13, fill_x
  ADD r2, r5
  CMP r2, r10
  BLT r13, fill_y

; ── Get checksum after (op=1) ──
LDI r6, 1
AI_AGENT r6       ; r13 = new checksum
MOV r8, r13        ; save in r8

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r0, 0x5000
LDI r6, 0x64      ; 'd'
STORE r0, r6
LDI r9, 0x65      ; 'e'
MOV r6, r0
ADD r6, r5
STORE r6, r9
LDI r9, 0x73      ; 's'
MOV r6, r0
ADD r6, r5
ADD r6, r5
STORE r6, r9
LDI r9, 0x63      ; 'c'
MOV r6, r0
ADD r6, r5
ADD r6, r5
ADD r6, r5
STORE r6, r9
MOV r6, r0
ADD r6, r5
ADD r6, r5
ADD r6, r5
ADD r6, r5
LDI r9, 0
STORE r6, r9

; Set up registers for vision API
LDI r6, 3         ; op=3 (vision API)
MOV r4, r0       ; prompt addr
LDI r14, 0x6000    ; response addr
LDI r8, 256       ; max response length
AI_AGENT r6       ; r13 = response length

HALT
