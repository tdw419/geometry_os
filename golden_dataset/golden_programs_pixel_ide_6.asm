; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

; pixel_ide.asm -- Windowed IDE Demo (Phase 70)
;
; Demonstrates a simple pixel IDE with three windowed panes:
; 1. Editor pane (top-left): Shows source code text
; 2. Build pane (top-right): Shows assembly status
; 3. Output pane (bottom): Shows program execution result
;
; The IDE writes a simple program to the canvas, assembles it,
; and shows the result in the output window.
; Uses WINSYS to create three windows, then draws into them.

; ---- Constants ----
LDI r20, 0x9000       ; title string storage
LDI r1, 1
LDI r14, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r11, 0x9000
LDI r13, 69; STORE r11, r13; ADD r11, r1
LDI r13, 100; STORE r11, r13; ADD r11, r1
LDI r13, 105; STORE r11, r13; ADD r11, r1
LDI r13, 116; STORE r11, r13; ADD r11, r1
LDI r13, 111; STORE r11, r13; ADD r11, r1
LDI r13, 114; STORE r11, r13; ADD r11, r1
LDI r13, 0; STORE r11, r13

; "Build" at 0x9010
LDI r11, 0x9010
LDI r13, 66; STORE r11, r13; ADD r11, r1
LDI r13, 117; STORE r11, r13; ADD r11, r1
LDI r13, 105; STORE r11, r13; ADD r11, r1
LDI r13, 108; STORE r11, r13; ADD r11, r1
LDI r13, 100; STORE r11, r13; ADD r11, r1
LDI r13, 0; STORE r11, r13

; "Output" at 0x9020
LDI r11, 0x9020
LDI r13, 79; STORE r11, r13; ADD r11, r1
LDI r13, 117; STORE r11, r13; ADD r11, r1
LDI r13, 116; STORE r11, r13; ADD r11, r1
LDI r13, 112; STORE r11, r13; ADD r11, r1
LDI r13, 117; STORE r11, r13; ADD r11, r1
LDI r13, 116; STORE r11, r13; ADD r11, r1
LDI r13, 0; STORE r11, r13

; ---- Write source code text to RAM for display ----
; "LDI r11, 42" at 0x9030
LDI r11, 0x9030
LDI r13, 76; STORE r11, r13; ADD r11, r1
LDI r13, 68; STORE r11, r13; ADD r11, r1
LDI r13, 73; STORE r11, r13; ADD r11, r1
LDI r13, 32; STORE r11, r13; ADD r11, r1
LDI r13, 114; STORE r11, r13; ADD r11, r1
LDI r13, 49; STORE r11, r13; ADD r11, r1
LDI r13, 44; STORE r11, r13; ADD r11, r1
LDI r13, 32; STORE r11, r13; ADD r11, r1
LDI r13, 52; STORE r11, r13; ADD r11, r1
LDI r13, 50; STORE r11, r13; ADD r11, r1
LDI r13, 10; STORE r11, r13; ADD r11, r1
LDI r13, 72; STORE r11, r13; ADD r11, r1
LDI r13, 65; STORE r11, r13; ADD r11, r1
LDI r13, 76; STORE r11, r13; ADD r11, r1
LDI r13, 84; STORE r11, r13; ADD r11, r1
LDI r13, 0; STORE r11, r13

; "OK: 3 words" at 0x9050
LDI r11, 0x9050
LDI r13, 79; STORE r11, r13; ADD r11, r1
LDI r13, 75; STORE r11, r13; ADD r11, r1
LDI r13, 58; STORE r11, r13; ADD r11, r1
LDI r13, 32; STORE r11, r13; ADD r11, r1
LDI r13, 51; STORE r11, r13; ADD r11, r1
LDI r13, 32; STORE r11, r13; ADD r11, r1
LDI r13, 119; STORE r11, r13; ADD r11, r1
LDI r13, 111; STORE r11, r13; ADD r11, r1
LDI r13, 114; STORE r11, r13; ADD r11, r1
LDI r13, 100; STORE r11, r13; ADD r11, r1
LDI r13, 115; STORE r11, r13; ADD r11, r1
LDI r13, 0; STORE r11, r13

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r11, 8
LDI r13, 8
LDI r6, 118
LDI r15, 100
LDI r7, 0x9000
LDI r4, 0
WINSYS r4
; r12 = window_id for editor (should be 1)

; Save editor window id
MOV r10, r12

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r11, 130
LDI r13, 8
LDI r6, 118
LDI r15, 100
LDI r7, 0x9010
LDI r4, 0
WINSYS r4
MOV r8, r12

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r11, 8
LDI r13, 116
LDI r6, 240
LDI r15, 132
LDI r7, 0x9020
LDI r4, 0
WINSYS r4
MOV r3, r12

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r9, 0x000022
LDI r2, 0

; Draw source code text into editor window
; Row 1: "LDI r11, 42" -- draw as green pixels
LDI r5, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r2, 76
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 68
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 73
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 32
WPIXEL r10, r16, r17, r2
ADD r16, r1
LDI r2, 114
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 49
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 44
WPIXEL r10, r16, r17, r2
ADD r16, r1
LDI r2, 32
WPIXEL r10, r16, r17, r2
ADD r16, r1
LDI r2, 52
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 50
WPIXEL r10, r16, r17, r5

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r2, 72
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 65
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 76
WPIXEL r10, r16, r17, r5
ADD r16, r1
LDI r2, 84
WPIXEL r10, r16, r17, r5

; ---- Draw build window content ----
; Green "OK" text
LDI r5, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r2, 79
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 75
WPIXEL r8, r16, r17, r5

; "3 words" in yellow below
LDI r5, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r2, 51
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 32
WPIXEL r8, r16, r17, r2
ADD r16, r1
LDI r2, 119
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 111
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 114
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 100
WPIXEL r8, r16, r17, r5
ADD r16, r1
LDI r2, 115
WPIXEL r8, r16, r17, r5

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r5, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r12, output_done
  WPIXEL r3, r16, r17, r5
  ADD r16, r1
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r5, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r12, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r12, output_gdone
  WPIXEL r3, r16, r17, r5
  ADD r16, r1
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r11, 42\nHALT\n" to 0x0800
LDI r11, 0x0800

LDI r13, 76
CALL wr
LDI r13, 68
CALL wr
LDI r13, 73
CALL wr
LDI r13, 32
CALL wr
LDI r13, 114
CALL wr
LDI r13, 49
CALL wr
LDI r13, 44
CALL wr
LDI r13, 32
CALL wr
LDI r13, 52
CALL wr
LDI r13, 50
CALL wr
LDI r13, 10
CALL wr
LDI r13, 72
CALL wr
LDI r13, 65
CALL wr
LDI r13, 76
CALL wr
LDI r13, 84
CALL wr
LDI r13, 10
CALL wr
LDI r13, 0
CALL wr

; Assemble it
LDI r7, 0x0800
LDI r4, 0x1000
ASM r7, r4

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r11, r13
    ADD r11, r1
    RET
