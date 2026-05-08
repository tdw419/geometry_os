; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
LDI r5, 0x202020
FILL r5

; --- title bar: RECTF at (0,0) 256x30, colour #555555 ---
LDI r0, 0
LDI r2, 0
LDI r14, 256
LDI r11, 30
LDI r15, 0x555555
RECTF r0, r2, r14, r11, r15

; --- title text "Hello" at (100, 10) ---
LDI r3, 0x2000
LDI r5, 72         ; H
STORE r3, r5
LDI r3, 0x2001
LDI r5, 101        ; e
STORE r3, r5
LDI r3, 0x2002
LDI r5, 108        ; l
STORE r3, r5
LDI r3, 0x2003
LDI r5, 108        ; l
STORE r3, r5
LDI r3, 0x2004
LDI r5, 111        ; o
STORE r3, r5
LDI r3, 0x2005
LDI r5, 0          ; NUL
STORE r3, r5
LDI r0, 100
LDI r2, 10
LDI r14, 0x2000
TEXT r0, r2, r14

; --- OK button body: RECTF at (88, 110) 80x28, colour #2266FF ---
LDI r0, 88
LDI r2, 110
LDI r14, 80
LDI r11, 28
LDI r15, 0x2266FF
RECTF r0, r2, r14, r11, r15

; --- register the same rect as hit-region id=1 ---
; r0..r11 still hold x,y,w,h from the RECTF above
HITSET r0, r2, r14, r11, 1

; --- button label "OK" at (120, 118) ---
LDI r3, 0x2010
LDI r5, 79         ; O
STORE r3, r5
LDI r3, 0x2011
LDI r5, 75         ; K
STORE r3, r5
LDI r3, 0x2012
LDI r5, 0
STORE r3, r5
LDI r0, 120
LDI r2, 118
LDI r14, 0x2010
TEXT r0, r2, r14

; --- demo: query cursor, put matched id in r6 ---
; (Host sets cursor via vm.push_mouse(x,y); without that, r6 = 0.)
HITQ r6

HALT
