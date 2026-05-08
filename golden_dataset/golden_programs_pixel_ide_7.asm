; DESCRIPTION: This GeOS assembly code sets up a simple pixel-based Integrated Development Environment (IDE) with three windowed panes: an editor pane for source code text, a build pane for assembly status, and an output pane for program execution results. It uses the WINSYS system calls to create and manage these windows, drawing titles and content into each using pixel manipulation instructions. The IDE also assembles and runs a simple program directly from RAM.

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
LDI r4, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r6, 0x9000
LDI r11, 69; STORE r6, r11; ADD r6, r13
LDI r11, 100; STORE r6, r11; ADD r6, r13
LDI r11, 105; STORE r6, r11; ADD r6, r13
LDI r11, 116; STORE r6, r11; ADD r6, r13
LDI r11, 111; STORE r6, r11; ADD r6, r13
LDI r11, 114; STORE r6, r11; ADD r6, r13
LDI r11, 0; STORE r6, r11

; "Build" at 0x9010
LDI r6, 0x9010
LDI r11, 66; STORE r6, r11; ADD r6, r13
LDI r11, 117; STORE r6, r11; ADD r6, r13
LDI r11, 105; STORE r6, r11; ADD r6, r13
LDI r11, 108; STORE r6, r11; ADD r6, r13
LDI r11, 100; STORE r6, r11; ADD r6, r13
LDI r11, 0; STORE r6, r11

; "Output" at 0x9020
LDI r6, 0x9020
LDI r11, 79; STORE r6, r11; ADD r6, r13
LDI r11, 117; STORE r6, r11; ADD r6, r13
LDI r11, 116; STORE r6, r11; ADD r6, r13
LDI r11, 112; STORE r6, r11; ADD r6, r13
LDI r11, 117; STORE r6, r11; ADD r6, r13
LDI r11, 116; STORE r6, r11; ADD r6, r13
LDI r11, 0; STORE r6, r11

; ---- Write source code text to RAM for display ----
; "LDI r6, 42" at 0x9030
LDI r6, 0x9030
LDI r11, 76; STORE r6, r11; ADD r6, r13
LDI r11, 68; STORE r6, r11; ADD r6, r13
LDI r11, 73; STORE r6, r11; ADD r6, r13
LDI r11, 32; STORE r6, r11; ADD r6, r13
LDI r11, 114; STORE r6, r11; ADD r6, r13
LDI r11, 49; STORE r6, r11; ADD r6, r13
LDI r11, 44; STORE r6, r11; ADD r6, r13
LDI r11, 32; STORE r6, r11; ADD r6, r13
LDI r11, 52; STORE r6, r11; ADD r6, r13
LDI r11, 50; STORE r6, r11; ADD r6, r13
LDI r11, 10; STORE r6, r11; ADD r6, r13
LDI r11, 72; STORE r6, r11; ADD r6, r13
LDI r11, 65; STORE r6, r11; ADD r6, r13
LDI r11, 76; STORE r6, r11; ADD r6, r13
LDI r11, 84; STORE r6, r11; ADD r6, r13
LDI r11, 0; STORE r6, r11

; "OK: 3 words" at 0x9050
LDI r6, 0x9050
LDI r11, 79; STORE r6, r11; ADD r6, r13
LDI r11, 75; STORE r6, r11; ADD r6, r13
LDI r11, 58; STORE r6, r11; ADD r6, r13
LDI r11, 32; STORE r6, r11; ADD r6, r13
LDI r11, 51; STORE r6, r11; ADD r6, r13
LDI r11, 32; STORE r6, r11; ADD r6, r13
LDI r11, 119; STORE r6, r11; ADD r6, r13
LDI r11, 111; STORE r6, r11; ADD r6, r13
LDI r11, 114; STORE r6, r11; ADD r6, r13
LDI r11, 100; STORE r6, r11; ADD r6, r13
LDI r11, 115; STORE r6, r11; ADD r6, r13
LDI r11, 0; STORE r6, r11

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r6, 8
LDI r11, 8
LDI r15, 118
LDI r7, 100
LDI r14, 0x9000
LDI r12, 0
WINSYS r12
; r8 = window_id for editor (should be 1)

; Save editor window id
MOV r2, r8

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r6, 130
LDI r11, 8
LDI r15, 118
LDI r7, 100
LDI r14, 0x9010
LDI r12, 0
WINSYS r12
MOV r1, r8

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r6, 8
LDI r11, 116
LDI r15, 240
LDI r7, 132
LDI r14, 0x9020
LDI r12, 0
WINSYS r12
MOV r3, r8

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r10, 0x000022
LDI r0, 0

; Draw source code text into editor window
; Row 1: "LDI r6, 42" -- draw as green pixels
LDI r5, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r0, 76
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 68
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 73
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 32
WPIXEL r2, r16, r17, r0
ADD r16, r13
LDI r0, 114
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 49
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 44
WPIXEL r2, r16, r17, r0
ADD r16, r13
LDI r0, 32
WPIXEL r2, r16, r17, r0
ADD r16, r13
LDI r0, 52
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 50
WPIXEL r2, r16, r17, r5

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r0, 72
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 65
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 76
WPIXEL r2, r16, r17, r5
ADD r16, r13
LDI r0, 84
WPIXEL r2, r16, r17, r5

; ---- Draw build window content ----
; Green "OK" text
LDI r5, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r0, 79
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 75
WPIXEL r1, r16, r17, r5

; "3 words" in yellow below
LDI r5, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r0, 51
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 32
WPIXEL r1, r16, r17, r0
ADD r16, r13
LDI r0, 119
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 111
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 114
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 100
WPIXEL r1, r16, r17, r5
ADD r16, r13
LDI r0, 115
WPIXEL r1, r16, r17, r5

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r5, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r8, output_done
  WPIXEL r3, r16, r17, r5
  ADD r16, r13
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r5, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r8, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r8, output_gdone
  WPIXEL r3, r16, r17, r5
  ADD r16, r13
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r6, 42\nHALT\n" to 0x0800
LDI r6, 0x0800

LDI r11, 76
CALL wr
LDI r11, 68
CALL wr
LDI r11, 73
CALL wr
LDI r11, 32
CALL wr
LDI r11, 114
CALL wr
LDI r11, 49
CALL wr
LDI r11, 44
CALL wr
LDI r11, 32
CALL wr
LDI r11, 52
CALL wr
LDI r11, 50
CALL wr
LDI r11, 10
CALL wr
LDI r11, 72
CALL wr
LDI r11, 65
CALL wr
LDI r11, 76
CALL wr
LDI r11, 84
CALL wr
LDI r11, 10
CALL wr
LDI r11, 0
CALL wr

; Assemble it
LDI r14, 0x0800
LDI r12, 0x1000
ASM r14, r12

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r6, r11
    ADD r6, r13
    RET
