; DESCRIPTION: This GeOS assembly code creates a minimalistic GUI with a dark grey background, a title bar with the text "Hello", and an OK button. The code fills the screen with pixels, defines semantic regions for interaction (specifically for the OK button), and queries cursor interactions to return the ID of the clicked region.

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
LDI r4, 0x202020
FILL r4

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r10, 0
LDI r13, 0
LDI r1, 256
LDI r7, 30
LDI r14, 0x555555
RECTF r10, r13, r1, r7, r14

; --- title text "Hello" at (100, 10) ---
LDI r8, 0x2000
LDI r4, 72         ; H
STORE r8, r4
LDI r8, 0x2001
LDI r4, 101        ; e
STORE r8, r4
LDI r8, 0x2002
LDI r4, 108        ; l
STORE r8, r4
LDI r8, 0x2003
LDI r4, 108        ; l
STORE r8, r4
LDI r8, 0x2004
LDI r4, 111        ; o
STORE r8, r4
LDI r8, 0x2005
LDI r4, 0          ; NUL
STORE r8, r4
LDI r10, 100
LDI r13, 10
LDI r1, 0x2000
TEXT r10, r13, r1

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r10, 88
LDI r13, 110
LDI r1, 80
LDI r7, 28
LDI r14, 0x2266FF
RECTF r10, r13, r1, r7, r14

; --- register the same rect as hit-region id=1 ---
; r10..r7 still hold x,y,w,h from the RECTF above
HITSET r10, r13, r1, r7, 1

; --- button label "OK" at (120, 118) ---
LDI r8, 0x2010
LDI r4, 79         ; O
STORE r8, r4
LDI r8, 0x2011
LDI r4, 75         ; K
STORE r8, r4
LDI r8, 0x2012
LDI r4, 0
STORE r8, r4
LDI r10, 120
LDI r13, 118
LDI r1, 0x2010
TEXT r10, r13, r1

; --- demo: query cursor, put matched id in r2 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r2 = 0.)
HITQ r2

HALT
