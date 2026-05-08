; DESCRIPTION: Draws a red square at the screen with fixed size.

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
LDI r13, 1
LDI r4, 0xFF0000   ; red
LDI r6, 0          ; y = 0
LDI r15, 256        ; screen width
LDI r10, 32         ; bar spacing

draw_loop:
  LDI r9, 0        ; x = 0
  draw_row:
    PSET r9, r6, r4
    ADD r9, r13     ; x++
    CMP r9, r15
    BLT r3, draw_row
  ADD r6, r13       ; y++
  CMP r6, r10
  BLT r3, draw_loop

; ── Get checksum before (op=1) ──
LDI r12, 1
AI_AGENT r12       ; r3 = checksum
MOV r0, r3        ; save in r0

; ── Modify screen -- blue square ──
LDI r4, 0x0000FF   ; blue
LDI r6, 100
LDI r10, 156

fill_y:
  LDI r9, 100
  fill_x:
    PSET r9, r6, r4
    ADD r9, r13
    CMP r9, r10
    BLT r3, fill_x
  ADD r6, r13
  CMP r6, r10
  BLT r3, fill_y

; ── Get checksum after (op=1) ──
LDI r12, 1
AI_AGENT r12       ; r3 = new checksum
MOV r1, r3        ; save in r1

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r14, 0x5000
LDI r12, 0x64      ; 'd'
STORE r14, r12
LDI r5, 0x65      ; 'e'
MOV r12, r14
ADD r12, r13
STORE r12, r5
LDI r5, 0x73      ; 's'
MOV r12, r14
ADD r12, r13
ADD r12, r13
STORE r12, r5
LDI r5, 0x63      ; 'c'
MOV r12, r14
ADD r12, r13
ADD r12, r13
ADD r12, r13
STORE r12, r5
MOV r12, r14
ADD r12, r13
ADD r12, r13
ADD r12, r13
ADD r12, r13
LDI r5, 0
STORE r12, r5

; Set up registers for vision API
LDI r12, 3         ; op=3 (vision API)
MOV r2, r14       ; prompt addr
LDI r0, 0x6000    ; response addr
LDI r1, 256       ; max response length
AI_AGENT r12       ; r3 = response length

HALT
