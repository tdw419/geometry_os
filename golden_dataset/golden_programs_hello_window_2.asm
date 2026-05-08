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
LDI r15, 0x202020
FILL r15

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r12, 0
LDI r9, 0
LDI r14, 256
LDI r6, 30
LDI r8, 0x555555
RECTF r12, r9, r14, r6, r8

; --- title text "Hello" at (100, 10) ---
LDI r7, 0x2000
LDI r15, 72         ; H
STORE r7, r15
LDI r7, 0x2001
LDI r15, 101        ; e
STORE r7, r15
LDI r7, 0x2002
LDI r15, 108        ; l
STORE r7, r15
LDI r7, 0x2003
LDI r15, 108        ; l
STORE r7, r15
LDI r7, 0x2004
LDI r15, 111        ; o
STORE r7, r15
LDI r7, 0x2005
LDI r15, 0          ; NUL
STORE r7, r15
LDI r12, 100
LDI r9, 10
LDI r14, 0x2000
TEXT r12, r9, r14

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r12, 88
LDI r9, 110
LDI r14, 80
LDI r6, 28
LDI r8, 0x2266FF
RECTF r12, r9, r14, r6, r8

; --- register the same rect as hit-region id=1 ---
; r12..r6 still hold x,y,w,h from the RECTF above
HITSET r12, r9, r14, r6, 1

; --- button label "OK" at (120, 118) ---
LDI r7, 0x2010
LDI r15, 79         ; O
STORE r7, r15
LDI r7, 0x2011
LDI r15, 75         ; K
STORE r7, r15
LDI r7, 0x2012
LDI r15, 0
STORE r7, r15
LDI r12, 120
LDI r9, 118
LDI r14, 0x2010
TEXT r12, r9, r14

; --- demo: query cursor, put matched id in r5 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r5 = 0.)
HITQ r5

HALT
