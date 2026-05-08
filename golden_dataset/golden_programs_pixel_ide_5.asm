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
LDI r4, 1
LDI r5, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r12, 0x9000
LDI r9, 69; STORE r12, r9; ADD r12, r4
LDI r9, 100; STORE r12, r9; ADD r12, r4
LDI r9, 105; STORE r12, r9; ADD r12, r4
LDI r9, 116; STORE r12, r9; ADD r12, r4
LDI r9, 111; STORE r12, r9; ADD r12, r4
LDI r9, 114; STORE r12, r9; ADD r12, r4
LDI r9, 0; STORE r12, r9

; "Build" at 0x9010
LDI r12, 0x9010
LDI r9, 66; STORE r12, r9; ADD r12, r4
LDI r9, 117; STORE r12, r9; ADD r12, r4
LDI r9, 105; STORE r12, r9; ADD r12, r4
LDI r9, 108; STORE r12, r9; ADD r12, r4
LDI r9, 100; STORE r12, r9; ADD r12, r4
LDI r9, 0; STORE r12, r9

; "Output" at 0x9020
LDI r12, 0x9020
LDI r9, 79; STORE r12, r9; ADD r12, r4
LDI r9, 117; STORE r12, r9; ADD r12, r4
LDI r9, 116; STORE r12, r9; ADD r12, r4
LDI r9, 112; STORE r12, r9; ADD r12, r4
LDI r9, 117; STORE r12, r9; ADD r12, r4
LDI r9, 116; STORE r12, r9; ADD r12, r4
LDI r9, 0; STORE r12, r9

; ---- Write source code text to RAM for display ----
; "LDI r12, 42" at 0x9030
LDI r12, 0x9030
LDI r9, 76; STORE r12, r9; ADD r12, r4
LDI r9, 68; STORE r12, r9; ADD r12, r4
LDI r9, 73; STORE r12, r9; ADD r12, r4
LDI r9, 32; STORE r12, r9; ADD r12, r4
LDI r9, 114; STORE r12, r9; ADD r12, r4
LDI r9, 49; STORE r12, r9; ADD r12, r4
LDI r9, 44; STORE r12, r9; ADD r12, r4
LDI r9, 32; STORE r12, r9; ADD r12, r4
LDI r9, 52; STORE r12, r9; ADD r12, r4
LDI r9, 50; STORE r12, r9; ADD r12, r4
LDI r9, 10; STORE r12, r9; ADD r12, r4
LDI r9, 72; STORE r12, r9; ADD r12, r4
LDI r9, 65; STORE r12, r9; ADD r12, r4
LDI r9, 76; STORE r12, r9; ADD r12, r4
LDI r9, 84; STORE r12, r9; ADD r12, r4
LDI r9, 0; STORE r12, r9

; "OK: 3 words" at 0x9050
LDI r12, 0x9050
LDI r9, 79; STORE r12, r9; ADD r12, r4
LDI r9, 75; STORE r12, r9; ADD r12, r4
LDI r9, 58; STORE r12, r9; ADD r12, r4
LDI r9, 32; STORE r12, r9; ADD r12, r4
LDI r9, 51; STORE r12, r9; ADD r12, r4
LDI r9, 32; STORE r12, r9; ADD r12, r4
LDI r9, 119; STORE r12, r9; ADD r12, r4
LDI r9, 111; STORE r12, r9; ADD r12, r4
LDI r9, 114; STORE r12, r9; ADD r12, r4
LDI r9, 100; STORE r12, r9; ADD r12, r4
LDI r9, 115; STORE r12, r9; ADD r12, r4
LDI r9, 0; STORE r12, r9

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r12, 8
LDI r9, 8
LDI r13, 118
LDI r0, 100
LDI r1, 0x9000
LDI r14, 0
WINSYS r14
; r11 = window_id for editor (should be 1)

; Save editor window id
MOV r7, r11

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r12, 130
LDI r9, 8
LDI r13, 118
LDI r0, 100
LDI r1, 0x9010
LDI r14, 0
WINSYS r14
MOV r10, r11

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r12, 8
LDI r9, 116
LDI r13, 240
LDI r0, 132
LDI r1, 0x9020
LDI r14, 0
WINSYS r14
MOV r2, r11

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r15, 0x000022
LDI r8, 0

; Draw source code text into editor window
; Row 1: "LDI r12, 42" -- draw as green pixels
LDI r6, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r8, 76
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 68
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 73
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 32
WPIXEL r7, r16, r17, r8
ADD r16, r4
LDI r8, 114
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 49
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 44
WPIXEL r7, r16, r17, r8
ADD r16, r4
LDI r8, 32
WPIXEL r7, r16, r17, r8
ADD r16, r4
LDI r8, 52
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 50
WPIXEL r7, r16, r17, r6

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r8, 72
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 65
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 76
WPIXEL r7, r16, r17, r6
ADD r16, r4
LDI r8, 84
WPIXEL r7, r16, r17, r6

; ---- Draw build window content ----
; Green "OK" text
LDI r6, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r8, 79
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 75
WPIXEL r10, r16, r17, r6

; "3 words" in yellow below
LDI r6, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r8, 51
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 32
WPIXEL r10, r16, r17, r8
ADD r16, r4
LDI r8, 119
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 111
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 114
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 100
WPIXEL r10, r16, r17, r6
ADD r16, r4
LDI r8, 115
WPIXEL r10, r16, r17, r6

; ---- Draw output window content ----
; Draw a colored bar to show "execution result"
LDI r6, 0x4444FF
LDI r16, 0
LDI r17, 10
LDI r18, 240
LDI r19, 0

output_bar:
  CMP r16, r18
  BGE r11, output_done
  WPIXEL r2, r16, r17, r6
  ADD r16, r4
  JMP output_bar

output_done:

; Also draw a smaller green result bar
LDI r6, 0x00FF00
LDI r16, 80
LDI r17, 20
LDI r19, 0

output_green:
  CMP r16, r19
  BGE r11, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r11, output_gdone
  WPIXEL r2, r16, r17, r6
  ADD r16, r4
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r12, 42\nHALT\n" to 0x0800
LDI r12, 0x0800

LDI r9, 76
CALL wr
LDI r9, 68
CALL wr
LDI r9, 73
CALL wr
LDI r9, 32
CALL wr
LDI r9, 114
CALL wr
LDI r9, 49
CALL wr
LDI r9, 44
CALL wr
LDI r9, 32
CALL wr
LDI r9, 52
CALL wr
LDI r9, 50
CALL wr
LDI r9, 10
CALL wr
LDI r9, 72
CALL wr
LDI r9, 65
CALL wr
LDI r9, 76
CALL wr
LDI r9, 84
CALL wr
LDI r9, 10
CALL wr
LDI r9, 0
CALL wr

; Assemble it
LDI r1, 0x0800
LDI r14, 0x1000
ASM r1, r14

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r12, r9
    ADD r12, r4
    RET
