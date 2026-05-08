; DESCRIPTION: Geometry OS program to draw a red object.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r4, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r10, 0             ; op=0 (inject key)
  LDI r3, 65            ; keycode = 65 ('A')
  LDI r12, 0             ; shift = 0
  AI_INJECT r10           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r8               ; r8 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r0, 0xFF00       ; green
  LDI r11, 0xFF0000     ; red
  LDI r9, 65           ; expected value
  CMP r8, r9
  JZ r5, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r11
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r0

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r10, 1             ; op=1 (inject mouse move)
  LDI r3, 128           ; x = 128
  LDI r12, 128           ; y = 128
  AI_INJECT r10           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r10, 2             ; op=2 (inject mouse click)
  LDI r3, 100           ; x = 100
  LDI r12, 200           ; y = 200
  LDI r8, 2             ; button = 2 (click)
  AI_INJECT r10           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r0, 0x2000
  LDI r11, 72           ; 'H'
  STORE r0, r11
  MOV r9, r0
  ADD r9, r4           ; r9 = 0x2001
  LDI r11, 73           ; 'I'
  STORE r9, r11
  MOV r9, r0
  ADD r9, r4
  ADD r9, r4           ; r9 = 0x2002
  LDI r11, 0
  STORE r9, r11        ; null terminator

  ; Inject the text string
  LDI r10, 3             ; op=3 (inject text string)
  LDI r3, 0x2000        ; addr of null-terminated string
  AI_INJECT r10           ; inject "HI" -- r5 = count (2)

  ; Draw colored bar for each injected char
  LDI r1, 0x0000FF     ; blue
  LDI r0, 10           ; start x
  LDI r11, 10           ; y position
  LDI r9, 10           ; width
  LDI r13, 10           ; height
  LDI r2, 0            ; counter

draw_loop:
  CMP r2, r5            ; compare counter with injected count
  BGE r5, done
  RECTF r0, r11, r9, r13, r1
  LDI r16, 12
  ADD r0, r16           ; move x right
  ADD r2, r4            ; counter++
  JMP draw_loop

done:
  HALT
