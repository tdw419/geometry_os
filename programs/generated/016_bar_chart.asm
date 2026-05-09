; BAR CHART -- 8 colored bars of different heights
; Bar 1: x=0, h=50, red
LDI r0, 0
LDI r1, 206
LDI r2, 30
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

; Bar 2: x=32, h=100, orange
LDI r0, 32
LDI r1, 156
LDI r2, 30
LDI r3, 100
LDI r4, 0xFF8000
RECTF r0, r1, r2, r3, r4

; Bar 3: x=64, h=150, yellow
LDI r0, 64
LDI r1, 106
LDI r2, 30
LDI r3, 150
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

; Bar 4: x=96, h=200, green
LDI r0, 96
LDI r1, 56
LDI r2, 30
LDI r3, 200
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4

; Bar 5: x=128, h=180, cyan
LDI r0, 128
LDI r1, 76
LDI r2, 30
LDI r3, 180
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4

; Bar 6: x=160, h=130, blue
LDI r0, 160
LDI r1, 126
LDI r2, 30
LDI r3, 130
LDI r4, 0x0080FF
RECTF r0, r1, r2, r3, r4

; Bar 7: x=192, h=80, purple
LDI r0, 192
LDI r1, 176
LDI r2, 30
LDI r3, 80
LDI r4, 0x8000FF
RECTF r0, r1, r2, r3, r4

; Bar 8: x=224, h=40, pink
LDI r0, 224
LDI r1, 216
LDI r2, 30
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

HALT
