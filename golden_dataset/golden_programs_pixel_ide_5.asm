; DESCRIPTION: Render a colored rectangle at the screen.

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
LDI r13, 1
LDI r11, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r15, 0x9000
LDI r0, 69; STORE r15, r0; ADD r15, r13
LDI r0, 100; STORE r15, r0; ADD r15, r13
LDI r0, 105; STORE r15, r0; ADD r15, r13
LDI r0, 116; STORE r15, r0; ADD r15, r13
LDI r0, 111; STORE r15, r0; ADD r15, r13
LDI r0, 114; STORE r15, r0; ADD r15, r13
LDI r0, 0; STORE r15, r0

; "Build" at 0x9010
LDI r15, 0x9010
LDI r0, 66; STORE r15, r0; ADD r15, r13
LDI r0, 117; STORE r15, r0; ADD r15, r13
LDI r0, 105; STORE r15, r0; ADD r15, r13
LDI r0, 108; STORE r15, r0; ADD r15, r13
LDI r0, 100; STORE r15, r0; ADD r15, r13
LDI r0, 0; STORE r15, r0

; "Output" at 0x9020
LDI r15, 0x9020
LDI r0, 79; STORE r15, r0; ADD r15, r13
LDI r0, 117; STORE r15, r0; ADD r15, r13
LDI r0, 116; STORE r15, r0; ADD r15, r13
LDI r0, 112; STORE r15, r0; ADD r15, r13
LDI r0, 117; STORE r15, r0; ADD r15, r13
LDI r0, 116; STORE r15, r0; ADD r15, r13
LDI r0, 0; STORE r15, r0

; ---- Write source code text to RAM for display ----
; "LDI r15, 42" at 0x9030
LDI r15, 0x9030
LDI r0, 76; STORE r15, r0; ADD r15, r13
LDI r0, 68; STORE r15, r0; ADD r15, r13
LDI r0, 73; STORE r15, r0; ADD r15, r13
LDI r0, 32; STORE r15, r0; ADD r15, r13
LDI r0, 114; STORE r15, r0; ADD r15, r13
LDI r0, 49; STORE r15, r0; ADD r15, r13
LDI r0, 44; STORE r15, r0; ADD r15, r13
LDI r0, 32; STORE r15, r0; ADD r15, r13
LDI r0, 52; STORE r15, r0; ADD r15, r13
LDI r0, 50; STORE r15, r0; ADD r15, r13
LDI r0, 10; STORE r15, r0; ADD r15, r13
LDI r0, 72; STORE r15, r0; ADD r15, r13
LDI r0, 65; STORE r15, r0; ADD r15, r13
LDI r0, 76; STORE r15, r0; ADD r15, r13
LDI r0, 84; STORE r15, r0; ADD r15, r13
LDI r0, 0; STORE r15, r0

; "OK: 3 words" at 0x9050
LDI r15, 0x9050
LDI r0, 79; STORE r15, r0; ADD r15, r13
LDI r0, 75; STORE r15, r0; ADD r15, r13
LDI r0, 58; STORE r15, r0; ADD r15, r13
LDI r0, 32; STORE r15, r0; ADD r15, r13
LDI r0, 51; STORE r15, r0; ADD r15, r13
LDI r0, 32; STORE r15, r0; ADD r15, r13
LDI r0, 119; STORE r15, r0; ADD r15, r13
LDI r0, 111; STORE r15, r0; ADD r15, r13
LDI r0, 114; STORE r15, r0; ADD r15, r13
LDI r0, 100; STORE r15, r0; ADD r15, r13
LDI r0, 115; STORE r15, r0; ADD r15, r13
LDI r0, 0; STORE r15, r0

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r15, 8
LDI r0, 8
LDI r10, 118
LDI r5, 100
LDI r12, 0x9000
LDI r9, 0
WINSYS r9
; r7 = window_id for editor (should be 1)

; Save editor window id
MOV r14, r7

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r15, 130
LDI r0, 8
LDI r10, 118
LDI r5, 100
LDI r12, 0x9010
LDI r9, 0
WINSYS r9
MOV r8, r7

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r15, 8
LDI r0, 116
LDI r10, 240
LDI r5, 132
LDI r12, 0x9020
LDI r9, 0
WINSYS r9
MOV r6, r7

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r3, 0x000022
LDI r1, 0

; Draw source code text into editor window
; Row 1: "LDI r15, 42" -- draw as green pixels
LDI r4, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r1, 76
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 68
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 73
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 32
WPIXEL r14, r16, r17, r1
ADD r16, r13
LDI r1, 114
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 49
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 44
WPIXEL r14, r16, r17, r1
ADD r16, r13
LDI r1, 32
WPIXEL r14, r16, r17, r1
ADD r16, r13
LDI r1, 52
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 50
WPIXEL r14, r16, r17, r4

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r1, 72
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 65
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 76
WPIXEL r14, r16, r17, r4
ADD r16, r13
LDI r1, 84
WPIXEL r14, r16, r17, r4

; ---- Draw build window content ----
; Green "OK" text
LDI r4, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r1, 79
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 75
WPIXEL r8, r16, r17, r4

; "3 words" in yellow below
LDI r4, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r1, 51
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 32
WPIXEL r8, r16, r17, r1
ADD r16, r13
LDI r1, 119
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 111
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 114
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 100
WPIXEL r8, r16, r17, r4
ADD r16, r13
LDI r1, 115
WPIXEL r8, r16, r17, r4

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r4, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r7, output_done
  WPIXEL r6, r16, r17, r4
  ADD r16, r13
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r4, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r7, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r7, output_gdone
  WPIXEL r6, r16, r17, r4
  ADD r16, r13
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r15, 42\nHALT\n" to 0x0800
LDI r15, 0x0800

LDI r0, 76
CALL wr
LDI r0, 68
CALL wr
LDI r0, 73
CALL wr
LDI r0, 32
CALL wr
LDI r0, 114
CALL wr
LDI r0, 49
CALL wr
LDI r0, 44
CALL wr
LDI r0, 32
CALL wr
LDI r0, 52
CALL wr
LDI r0, 50
CALL wr
LDI r0, 10
CALL wr
LDI r0, 72
CALL wr
LDI r0, 65
CALL wr
LDI r0, 76
CALL wr
LDI r0, 84
CALL wr
LDI r0, 10
CALL wr
LDI r0, 0
CALL wr

; Assemble it
LDI r12, 0x0800
LDI r9, 0x1000
ASM r12, r9

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r15, r0
    ADD r15, r13
    RET
