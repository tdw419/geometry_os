; DESCRIPTION: Render a colored object at the screen.

; hello_window.asm -- Token-to-Pixel GUI "Hello World"
;
; Proves the full loop: RECTF draws pixels, HITSET makes them semantic,
; HITQ reads the cursor. This is the minimum-viable GUI in Geometry OS.
;
; Layout (256x256 screen):
;   +-----------------------------+
;   | #555555 title bar (30px)    |
;   | "Hello"                     |
;   +-----------------------------+
;   |                             |
;   |   [ #2266FF OK button ]     |
;   |                             |
;   +-----------------------------+
;
; After HALT:
;   - vm.screen has the rendered UI
;   - vm.hit_regions has 1 entry (the OK button) with id=1
;   - A host that calls vm.push_mouse(x, y) and re-runs HITQ gets the id back

; --- background fill (dark grey) ---
LDI r13, 0x202020
FILL r13

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r10, 0
LDI r5, 0
LDI r9, 256
LDI r15, 30
LDI r4, 0x555555
RECTF r10, r5, r9, r15, r4

; --- title text "Hello" at (100, 10) ---
LDI r8, 0x2000
LDI r13, 72         ; H
STORE r8, r13
LDI r8, 0x2001
LDI r13, 101        ; e
STORE r8, r13
LDI r8, 0x2002
LDI r13, 108        ; l
STORE r8, r13
LDI r8, 0x2003
LDI r13, 108        ; l
STORE r8, r13
LDI r8, 0x2004
LDI r13, 111        ; o
STORE r8, r13
LDI r8, 0x2005
LDI r13, 0          ; NUL
STORE r8, r13
LDI r10, 100
LDI r5, 10
LDI r9, 0x2000
TEXT r10, r5, r9

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r10, 88
LDI r5, 110
LDI r9, 80
LDI r15, 28
LDI r4, 0x2266FF
RECTF r10, r5, r9, r15, r4

; --- register the same rect as hit-region id=1 ---
; r10..r15 still hold x,y,w,h from the RECTF above
HITSET r10, r5, r9, r15, 1

; --- button label "OK" at (120, 118) ---
LDI r8, 0x2010
LDI r13, 79         ; O
STORE r8, r13
LDI r8, 0x2011
LDI r13, 75         ; K
STORE r8, r13
LDI r8, 0x2012
LDI r13, 0
STORE r8, r13
LDI r10, 120
LDI r5, 118
LDI r9, 0x2010
TEXT r10, r5, r9

; --- demo: query cursor, put matched id in r3 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r3 = 0.)
HITQ r3

HALT
