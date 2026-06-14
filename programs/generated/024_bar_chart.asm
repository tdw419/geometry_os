; BAR CHART -- 8 bars with different heights and colors
; Bars grow upward from the bottom of the 256x256 screen

; Bar 1: x=4, h=200, red
LDI r0, 4
LDI r1, 56
LDI r2, 24
LDI r3, 200
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

; Bar 2: x=36, h=150, green
LDI r0, 36
LDI r1, 106
LDI r2, 24
LDI r3, 150
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4

; Bar 3: x=68, h=180, blue
LDI r0, 68
LDI r1, 76
LDI r2, 24
LDI r3, 180
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4

; Bar 4: x=100, h=100, yellow
LDI r0, 100
LDI r1, 156
LDI r2, 24
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

; Bar 5: x=132, h=220, cyan
LDI r0, 132
LDI r1, 36
LDI r2, 24
LDI r3, 220
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4

; Bar 6: x=164, h=130, magenta
LDI r0, 164
LDI r1, 126
LDI r2, 24
LDI r3, 130
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

; Bar 7: x=196, h=170, orange
LDI r0, 196
LDI r1, 86
LDI r2, 24
LDI r3, 170
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4

; Bar 8: x=228, h=160, white
LDI r0, 228
LDI r1, 96
LDI r2, 24
LDI r3, 160
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

HALT
