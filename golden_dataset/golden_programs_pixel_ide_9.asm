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
LDI r14, 1
LDI r15, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r5, 0x9000
LDI r12, 69; STORE r5, r12; ADD r5, r14
LDI r12, 100; STORE r5, r12; ADD r5, r14
LDI r12, 105; STORE r5, r12; ADD r5, r14
LDI r12, 116; STORE r5, r12; ADD r5, r14
LDI r12, 111; STORE r5, r12; ADD r5, r14
LDI r12, 114; STORE r5, r12; ADD r5, r14
LDI r12, 0; STORE r5, r12

; "Build" at 0x9010
LDI r5, 0x9010
LDI r12, 66; STORE r5, r12; ADD r5, r14
LDI r12, 117; STORE r5, r12; ADD r5, r14
LDI r12, 105; STORE r5, r12; ADD r5, r14
LDI r12, 108; STORE r5, r12; ADD r5, r14
LDI r12, 100; STORE r5, r12; ADD r5, r14
LDI r12, 0; STORE r5, r12

; "Output" at 0x9020
LDI r5, 0x9020
LDI r12, 79; STORE r5, r12; ADD r5, r14
LDI r12, 117; STORE r5, r12; ADD r5, r14
LDI r12, 116; STORE r5, r12; ADD r5, r14
LDI r12, 112; STORE r5, r12; ADD r5, r14
LDI r12, 117; STORE r5, r12; ADD r5, r14
LDI r12, 116; STORE r5, r12; ADD r5, r14
LDI r12, 0; STORE r5, r12

; ---- Write source code text to RAM for display ----
; "LDI r5, 42" at 0x9030
LDI r5, 0x9030
LDI r12, 76; STORE r5, r12; ADD r5, r14
LDI r12, 68; STORE r5, r12; ADD r5, r14
LDI r12, 73; STORE r5, r12; ADD r5, r14
LDI r12, 32; STORE r5, r12; ADD r5, r14
LDI r12, 114; STORE r5, r12; ADD r5, r14
LDI r12, 49; STORE r5, r12; ADD r5, r14
LDI r12, 44; STORE r5, r12; ADD r5, r14
LDI r12, 32; STORE r5, r12; ADD r5, r14
LDI r12, 52; STORE r5, r12; ADD r5, r14
LDI r12, 50; STORE r5, r12; ADD r5, r14
LDI r12, 10; STORE r5, r12; ADD r5, r14
LDI r12, 72; STORE r5, r12; ADD r5, r14
LDI r12, 65; STORE r5, r12; ADD r5, r14
LDI r12, 76; STORE r5, r12; ADD r5, r14
LDI r12, 84; STORE r5, r12; ADD r5, r14
LDI r12, 0; STORE r5, r12

; "OK: 3 words" at 0x9050
LDI r5, 0x9050
LDI r12, 79; STORE r5, r12; ADD r5, r14
LDI r12, 75; STORE r5, r12; ADD r5, r14
LDI r12, 58; STORE r5, r12; ADD r5, r14
LDI r12, 32; STORE r5, r12; ADD r5, r14
LDI r12, 51; STORE r5, r12; ADD r5, r14
LDI r12, 32; STORE r5, r12; ADD r5, r14
LDI r12, 119; STORE r5, r12; ADD r5, r14
LDI r12, 111; STORE r5, r12; ADD r5, r14
LDI r12, 114; STORE r5, r12; ADD r5, r14
LDI r12, 100; STORE r5, r12; ADD r5, r14
LDI r12, 115; STORE r5, r12; ADD r5, r14
LDI r12, 0; STORE r5, r12

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r5, 8
LDI r12, 8
LDI r13, 118
LDI r11, 100
LDI r0, 0x9000
LDI r8, 0
WINSYS r8
; r10 = window_id for editor (should be 1)

; Save editor window id
MOV r9, r10

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r5, 130
LDI r12, 8
LDI r13, 118
LDI r11, 100
LDI r0, 0x9010
LDI r8, 0
WINSYS r8
MOV r4, r10

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r5, 8
LDI r12, 116
LDI r13, 240
LDI r11, 132
LDI r0, 0x9020
LDI r8, 0
WINSYS r8
MOV r3, r10

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r1, 0x000022
LDI r7, 0

; Draw source code text into editor window
; Row 1: "LDI r5, 42" -- draw as green pixels
LDI r6, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r7, 76
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 68
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 73
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 32
WPIXEL r9, r16, r17, r7
ADD r16, r14
LDI r7, 114
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 49
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 44
WPIXEL r9, r16, r17, r7
ADD r16, r14
LDI r7, 32
WPIXEL r9, r16, r17, r7
ADD r16, r14
LDI r7, 52
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 50
WPIXEL r9, r16, r17, r6

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r7, 72
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 65
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 76
WPIXEL r9, r16, r17, r6
ADD r16, r14
LDI r7, 84
WPIXEL r9, r16, r17, r6

; ---- Draw build window content ----
; Green "OK" text
LDI r6, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r7, 79
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 75
WPIXEL r4, r16, r17, r6

; "3 words" in yellow below
LDI r6, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r7, 51
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 32
WPIXEL r4, r16, r17, r7
ADD r16, r14
LDI r7, 119
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 111
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 114
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 100
WPIXEL r4, r16, r17, r6
ADD r16, r14
LDI r7, 115
WPIXEL r4, r16, r17, r6

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r6, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r10, output_done
  WPIXEL r3, r16, r17, r6
  ADD r16, r14
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r6, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r10, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r10, output_gdone
  WPIXEL r3, r16, r17, r6
  ADD r16, r14
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r5, 42\nHALT\n" to 0x0800
LDI r5, 0x0800

LDI r12, 76
CALL wr
LDI r12, 68
CALL wr
LDI r12, 73
CALL wr
LDI r12, 32
CALL wr
LDI r12, 114
CALL wr
LDI r12, 49
CALL wr
LDI r12, 44
CALL wr
LDI r12, 32
CALL wr
LDI r12, 52
CALL wr
LDI r12, 50
CALL wr
LDI r12, 10
CALL wr
LDI r12, 72
CALL wr
LDI r12, 65
CALL wr
LDI r12, 76
CALL wr
LDI r12, 84
CALL wr
LDI r12, 10
CALL wr
LDI r12, 0
CALL wr

; Assemble it
LDI r0, 0x0800
LDI r8, 0x1000
ASM r0, r8

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r5, r12
    ADD r5, r14
    RET
