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
LDI r3, 0x202020
FILL r3

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r7, 0
LDI r14, 0
LDI r11, 256
LDI r6, 30
LDI r10, 0x555555
RECTF r7, r14, r11, r6, r10

; --- title text "Hello" at (100, 10) ---
LDI r5, 0x2000
LDI r3, 72         ; H
STORE r5, r3
LDI r5, 0x2001
LDI r3, 101        ; e
STORE r5, r3
LDI r5, 0x2002
LDI r3, 108        ; l
STORE r5, r3
LDI r5, 0x2003
LDI r3, 108        ; l
STORE r5, r3
LDI r5, 0x2004
LDI r3, 111        ; o
STORE r5, r3
LDI r5, 0x2005
LDI r3, 0          ; NUL
STORE r5, r3
LDI r7, 100
LDI r14, 10
LDI r11, 0x2000
TEXT r7, r14, r11

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r7, 88
LDI r14, 110
LDI r11, 80
LDI r6, 28
LDI r10, 0x2266FF
RECTF r7, r14, r11, r6, r10

; --- register the same rect as hit-region id=1 ---
; r7..r6 still hold x,y,w,h from the RECTF above
HITSET r7, r14, r11, r6, 1

; --- button label "OK" at (120, 118) ---
LDI r5, 0x2010
LDI r3, 79         ; O
STORE r5, r3
LDI r5, 0x2011
LDI r3, 75         ; K
STORE r5, r3
LDI r5, 0x2012
LDI r3, 0
STORE r5, r3
LDI r7, 120
LDI r14, 118
LDI r11, 0x2010
TEXT r7, r14, r11

; --- demo: query cursor, put matched id in r9 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r9 = 0.)
HITQ r9

HALT
