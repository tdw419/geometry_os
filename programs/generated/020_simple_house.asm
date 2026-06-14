; 020_simple_house.asm -- A simple house with sky, walls, roof, door, and window

; Sky background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x87CEEB
RECTF r0, r1, r2, r3, r4

; Ground
LDI r0, 0
LDI r1, 200
LDI r2, 256
LDI r3, 56
LDI r4, 0x228B22
RECTF r0, r1, r2, r3, r4

; House body (brown walls)
LDI r0, 68
LDI r1, 120
LDI r2, 120
LDI r3, 80
LDI r4, 0x8B4513
RECTF r0, r1, r2, r3, r4

; Roof (red triangle via lines)
LDI r5, 0xCC0000

; Left slope: (60, 120) to (128, 60)
LDI r0, 60
LDI r1, 120
LDI r2, 128
LDI r3, 60
LINE r0, r1, r2, r3, r5

; Right slope: (128, 60) to (196, 120)
LDI r0, 128
LDI r1, 60
LDI r2, 196
LDI r3, 120
LINE r0, r1, r2, r3, r5

; Fill roof triangle with red rectangles
LDI r0, 80
LDI r1, 100
LDI r2, 96
LDI r3, 20
LDI r4, 0xCC0000
RECTF r0, r1, r2, r3, r4

LDI r0, 90
LDI r1, 80
LDI r2, 76
LDI r3, 20
RECTF r0, r1, r2, r3, r4

LDI r0, 100
LDI r1, 65
LDI r2, 56
LDI r3, 15
RECTF r0, r1, r2, r3, r4

; Door
LDI r0, 115
LDI r1, 155
LDI r2, 26
LDI r3, 45
LDI r4, 0x654321
RECTF r0, r1, r2, r3, r4

; Window
LDI r0, 78
LDI r1, 140
LDI r2, 26
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

; Sun
LDI r0, 220
LDI r1, 40
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3

HALT
