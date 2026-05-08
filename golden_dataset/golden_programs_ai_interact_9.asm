; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r12, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r11, 0             ; op=0 (inject key)
  LDI r7, 65            ; keycode = 65 ('A')
  LDI r5, 0             ; shift = 0
  AI_INJECT r11           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r9               ; r9 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r15, 0xFF00       ; green
  LDI r10, 0xFF0000     ; red
  LDI r1, 65           ; expected value
  CMP r9, r1
  JZ r2, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r10
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r15

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r11, 1             ; op=1 (inject mouse move)
  LDI r7, 128           ; x = 128
  LDI r5, 128           ; y = 128
  AI_INJECT r11           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r11, 2             ; op=2 (inject mouse click)
  LDI r7, 100           ; x = 100
  LDI r5, 200           ; y = 200
  LDI r9, 2             ; button = 2 (click)
  AI_INJECT r11           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r15, 0x2000
  LDI r10, 72           ; 'H'
  STORE r15, r10
  MOV r1, r15
  ADD r1, r12           ; r1 = 0x2001
  LDI r10, 73           ; 'I'
  STORE r1, r10
  MOV r1, r15
  ADD r1, r12
  ADD r1, r12           ; r1 = 0x2002
  LDI r10, 0
  STORE r1, r10        ; null terminator

  ; Inject the text string
  LDI r11, 3             ; op=3 (inject text string)
  LDI r7, 0x2000        ; addr of null-terminated string
  AI_INJECT r11           ; inject "HI" -- r2 = count (2)

  ; Draw colored bar for each injected char
  LDI r4, 0x0000FF     ; blue
  LDI r15, 10           ; start x
  LDI r10, 10           ; y position
  LDI r1, 10           ; width
  LDI r0, 10           ; height
  LDI r6, 0            ; counter

draw_loop:
  CMP r6, r2            ; compare counter with injected count
  BGE r2, done
  RECTF r15, r10, r1, r0, r4
  LDI r16, 12
  ADD r15, r16           ; move x right
  ADD r6, r12            ; counter++
  JMP draw_loop

done:
  HALT
