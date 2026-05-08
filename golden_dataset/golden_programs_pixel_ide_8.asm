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
LDI r2, 0

; ---- Write title strings to RAM ----

; "Editor" at 0x9000
LDI r9, 0x9000
LDI r0, 69; STORE r9, r0; ADD r9, r13
LDI r0, 100; STORE r9, r0; ADD r9, r13
LDI r0, 105; STORE r9, r0; ADD r9, r13
LDI r0, 116; STORE r9, r0; ADD r9, r13
LDI r0, 111; STORE r9, r0; ADD r9, r13
LDI r0, 114; STORE r9, r0; ADD r9, r13
LDI r0, 0; STORE r9, r0

; "Build" at 0x9010
LDI r9, 0x9010
LDI r0, 66; STORE r9, r0; ADD r9, r13
LDI r0, 117; STORE r9, r0; ADD r9, r13
LDI r0, 105; STORE r9, r0; ADD r9, r13
LDI r0, 108; STORE r9, r0; ADD r9, r13
LDI r0, 100; STORE r9, r0; ADD r9, r13
LDI r0, 0; STORE r9, r0

; "Output" at 0x9020
LDI r9, 0x9020
LDI r0, 79; STORE r9, r0; ADD r9, r13
LDI r0, 117; STORE r9, r0; ADD r9, r13
LDI r0, 116; STORE r9, r0; ADD r9, r13
LDI r0, 112; STORE r9, r0; ADD r9, r13
LDI r0, 117; STORE r9, r0; ADD r9, r13
LDI r0, 116; STORE r9, r0; ADD r9, r13
LDI r0, 0; STORE r9, r0

; ---- Write source code text to RAM for display ----
; "LDI r9, 42" at 0x9030
LDI r9, 0x9030
LDI r0, 76; STORE r9, r0; ADD r9, r13
LDI r0, 68; STORE r9, r0; ADD r9, r13
LDI r0, 73; STORE r9, r0; ADD r9, r13
LDI r0, 32; STORE r9, r0; ADD r9, r13
LDI r0, 114; STORE r9, r0; ADD r9, r13
LDI r0, 49; STORE r9, r0; ADD r9, r13
LDI r0, 44; STORE r9, r0; ADD r9, r13
LDI r0, 32; STORE r9, r0; ADD r9, r13
LDI r0, 52; STORE r9, r0; ADD r9, r13
LDI r0, 50; STORE r9, r0; ADD r9, r13
LDI r0, 10; STORE r9, r0; ADD r9, r13
LDI r0, 72; STORE r9, r0; ADD r9, r13
LDI r0, 65; STORE r9, r0; ADD r9, r13
LDI r0, 76; STORE r9, r0; ADD r9, r13
LDI r0, 84; STORE r9, r0; ADD r9, r13
LDI r0, 0; STORE r9, r0

; "OK: 3 words" at 0x9050
LDI r9, 0x9050
LDI r0, 79; STORE r9, r0; ADD r9, r13
LDI r0, 75; STORE r9, r0; ADD r9, r13
LDI r0, 58; STORE r9, r0; ADD r9, r13
LDI r0, 32; STORE r9, r0; ADD r9, r13
LDI r0, 51; STORE r9, r0; ADD r9, r13
LDI r0, 32; STORE r9, r0; ADD r9, r13
LDI r0, 119; STORE r9, r0; ADD r9, r13
LDI r0, 111; STORE r9, r0; ADD r9, r13
LDI r0, 114; STORE r9, r0; ADD r9, r13
LDI r0, 100; STORE r9, r0; ADD r9, r13
LDI r0, 115; STORE r9, r0; ADD r9, r13
LDI r0, 0; STORE r9, r0

; ---- Create three windows ----

; Window 1: Editor (top-left) -- x=8, y=8, w=118, h=100
LDI r9, 8
LDI r0, 8
LDI r10, 118
LDI r4, 100
LDI r11, 0x9000
LDI r14, 0
WINSYS r14
; r1 = window_id for editor (should be 1)

; Save editor window id
MOV r15, r1

; Window 2: Build (top-right) -- x=130, y=8, w=118, h=100
LDI r9, 130
LDI r0, 8
LDI r10, 118
LDI r4, 100
LDI r11, 0x9010
LDI r14, 0
WINSYS r14
MOV r8, r1

; Window 3: Output (bottom) -- x=8, y=116, w=240, h=132
LDI r9, 8
LDI r0, 116
LDI r10, 240
LDI r4, 132
LDI r11, 0x9020
LDI r14, 0
WINSYS r14
MOV r3, r1

; ---- Draw editor window content ----
; Fill editor with dark blue background
LDI r7, 0x000022
LDI r12, 0

; Draw source code text into editor window
; Row 1: "LDI r9, 42" -- draw as green pixels
LDI r5, 0x00CC00
LDI r16, 2
LDI r17, 4

; Draw 'L' in editor
LDI r12, 76
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 68
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 73
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 32
WPIXEL r15, r16, r17, r12
ADD r16, r13
LDI r12, 114
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 49
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 44
WPIXEL r15, r16, r17, r12
ADD r16, r13
LDI r12, 32
WPIXEL r15, r16, r17, r12
ADD r16, r13
LDI r12, 52
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 50
WPIXEL r15, r16, r17, r5

; Row 2: "HALT" in editor
LDI r16, 2
LDI r17, 6
LDI r12, 72
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 65
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 76
WPIXEL r15, r16, r17, r5
ADD r16, r13
LDI r12, 84
WPIXEL r15, r16, r17, r5

; ---- Draw build window content ----
; Green "OK" text
LDI r5, 0x00FF00
LDI r16, 2
LDI r17, 4
LDI r12, 79
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 75
WPIXEL r8, r16, r17, r5

; "3 words" in yellow below
LDI r5, 0xFFFF00
LDI r16, 2
LDI r17, 8
LDI r12, 51
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 32
WPIXEL r8, r16, r17, r12
ADD r16, r13
LDI r12, 119
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 111
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 114
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 100
WPIXEL r8, r16, r17, r5
ADD r16, r13
LDI r12, 115
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
  BGE r1, output_done
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
  BGE r1, output_gdone
  ; Check: r19 = 160
  LDI r20, 160
  CMP r16, r20
  BGE r1, output_gdone
  WPIXEL r3, r16, r17, r5
  ADD r16, r13
  JMP output_green

output_gdone:

; ---- Assemble the actual source code and run it ----
; Write "LDI r9, 42\nHALT\n" to 0x0800
LDI r9, 0x0800

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
LDI r11, 0x0800
LDI r14, 0x1000
ASM r11, r14

; Run it
JMP 0x1000

; ---- Subroutine: write char to RAM ----
wr:
    STORE r9, r0
    ADD r9, r13
    RET
