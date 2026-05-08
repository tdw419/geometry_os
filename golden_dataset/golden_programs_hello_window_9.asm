; DESCRIPTION: A colored object centered at the screen with fixed size.

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
LDI r6, 0
LDI r10, 0
LDI r2, 256
LDI r13, 30
LDI r11, 0x555555
RECTF r6, r10, r2, r13, r11

; --- title text "Hello" at (100, 10) ---
LDI r1, 0x2000
LDI r3, 72         ; H
STORE r1, r3
LDI r1, 0x2001
LDI r3, 101        ; e
STORE r1, r3
LDI r1, 0x2002
LDI r3, 108        ; l
STORE r1, r3
LDI r1, 0x2003
LDI r3, 108        ; l
STORE r1, r3
LDI r1, 0x2004
LDI r3, 111        ; o
STORE r1, r3
LDI r1, 0x2005
LDI r3, 0          ; NUL
STORE r1, r3
LDI r6, 100
LDI r10, 10
LDI r2, 0x2000
TEXT r6, r10, r2

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r6, 88
LDI r10, 110
LDI r2, 80
LDI r13, 28
LDI r11, 0x2266FF
RECTF r6, r10, r2, r13, r11

; --- register the same rect as hit-region id=1 ---
; r6..r13 still hold x,y,w,h from the RECTF above
HITSET r6, r10, r2, r13, 1

; --- button label "OK" at (120, 118) ---
LDI r1, 0x2010
LDI r3, 79         ; O
STORE r1, r3
LDI r1, 0x2011
LDI r3, 75         ; K
STORE r1, r3
LDI r1, 0x2012
LDI r3, 0
STORE r1, r3
LDI r6, 120
LDI r10, 118
LDI r2, 0x2010
TEXT r6, r10, r2

; --- demo: query cursor, put matched id in r14 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r14 = 0.)
HITQ r14

HALT
