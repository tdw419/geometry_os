; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r2, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r10, 0             ; op=0 (inject key)
  LDI r13, 65            ; keycode = 65 ('A')
  LDI r7, 0             ; shift = 0
  AI_INJECT r10           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r8               ; r8 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r9, 0xFF00       ; green
  LDI r0, 0xFF0000     ; red
  LDI r5, 65           ; expected value
  CMP r8, r5
  JZ r3, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r0
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r9

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r10, 1             ; op=1 (inject mouse move)
  LDI r13, 128           ; x = 128
  LDI r7, 128           ; y = 128
  AI_INJECT r10           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r10, 2             ; op=2 (inject mouse click)
  LDI r13, 100           ; x = 100
  LDI r7, 200           ; y = 200
  LDI r8, 2             ; button = 2 (click)
  AI_INJECT r10           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r9, 0x2000
  LDI r0, 72           ; 'H'
  STORE r9, r0
  MOV r5, r9
  ADD r5, r2           ; r5 = 0x2001
  LDI r0, 73           ; 'I'
  STORE r5, r0
  MOV r5, r9
  ADD r5, r2
  ADD r5, r2           ; r5 = 0x2002
  LDI r0, 0
  STORE r5, r0        ; null terminator

  ; Inject the text string
  LDI r10, 3             ; op=3 (inject text string)
  LDI r13, 0x2000        ; addr of null-terminated string
  AI_INJECT r10           ; inject "HI" -- r3 = count (2)

  ; Draw colored bar for each injected char
  LDI r4, 0x0000FF     ; blue
  LDI r9, 10           ; start x
  LDI r0, 10           ; y position
  LDI r5, 10           ; width
  LDI r1, 10           ; height
  LDI r14, 0            ; counter

draw_loop:
  CMP r14, r3            ; compare counter with injected count
  BGE r3, done
  RECTF r9, r0, r5, r1, r4
  LDI r16, 12
  ADD r9, r16           ; move x right
  ADD r14, r2            ; counter++
  JMP draw_loop

done:
  HALT
