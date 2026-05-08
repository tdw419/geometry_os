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
LDI r9, 0x202020
FILL r9

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r5, 0
LDI r14, 0
LDI r0, 256
LDI r15, 30
LDI r13, 0x555555
RECTF r5, r14, r0, r15, r13

; --- title text "Hello" at (100, 10) ---
LDI r10, 0x2000
LDI r9, 72         ; H
STORE r10, r9
LDI r10, 0x2001
LDI r9, 101        ; e
STORE r10, r9
LDI r10, 0x2002
LDI r9, 108        ; l
STORE r10, r9
LDI r10, 0x2003
LDI r9, 108        ; l
STORE r10, r9
LDI r10, 0x2004
LDI r9, 111        ; o
STORE r10, r9
LDI r10, 0x2005
LDI r9, 0          ; NUL
STORE r10, r9
LDI r5, 100
LDI r14, 10
LDI r0, 0x2000
TEXT r5, r14, r0

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r5, 88
LDI r14, 110
LDI r0, 80
LDI r15, 28
LDI r13, 0x2266FF
RECTF r5, r14, r0, r15, r13

; --- register the same rect as hit-region id=1 ---
; r5..r15 still hold x,y,w,h from the RECTF above
HITSET r5, r14, r0, r15, 1

; --- button label "OK" at (120, 118) ---
LDI r10, 0x2010
LDI r9, 79         ; O
STORE r10, r9
LDI r10, 0x2011
LDI r9, 75         ; K
STORE r10, r9
LDI r10, 0x2012
LDI r9, 0
STORE r10, r9
LDI r5, 120
LDI r14, 118
LDI r0, 0x2010
TEXT r5, r14, r0

; --- demo: query cursor, put matched id in r4 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r4 = 0.)
HITQ r4

HALT
