; 053_sunset_landscape.asm -- Sunset over mountains with lake reflection
; Sky gradient, sun, mountain silhouettes, lake

; Dark sky background
LDI r0, 0x110022
FILL r0

; Sky gradient: 8 horizontal bands from dark blue to orange
; Band 0: y=0, dark purple-blue
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 32
LDI r4, 0x110022
RECTF r0, r1, r2, r3, r4

; Band 1: y=32
LDI r1, 32
LDI r4, 0x220044
RECTF r0, r1, r2, r3, r4

; Band 2: y=64
LDI r1, 64
LDI r4, 0x440066
RECTF r0, r1, r2, r3, r4

; Band 3: y=96
LDI r1, 96
LDI r4, 0x882244
RECTF r0, r1, r2, r3, r4

; Band 4: y=128
LDI r1, 128
LDI r4, 0xCC4422
RECTF r0, r1, r2, r3, r4

; Band 5: y=160
LDI r1, 160
LDI r4, 0xEE6611
RECTF r0, r1, r2, r3, r4

; Band 6: y=192 (horizon glow)
LDI r1, 192
LDI r4, 0xFF8833
RECTF r0, r1, r2, r3, r4

; Band 7: y=224 (bottom glow)
LDI r1, 224
LDI r4, 0xCC5522
RECTF r0, r1, r2, r3, r4

; Sun: large circle near horizon
LDI r0, 128
LDI r1, 170
LDI r2, 50
LDI r3, 0xFFDD00
CIRCLE r0, r1, r2, r3

; Sun glow (larger, dimmer)
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3

; Far mountain range (dark silhouette) - left peak
; Triangle via LINEs
LDI r5, 0x1A0A2A

; Left mountain: peak (40, 140), base (0, 200) to (90, 200)
LDI r0, 0
LDI r1, 200
LDI r2, 40
LDI r3, 140
LINE r0, r1, r2, r3, r5

LDI r0, 40
LDI r1, 140
LDI r2, 90
LDI r3, 200
LINE r0, r1, r2, r3, r5

LDI r0, 0
LDI r1, 200
LDI r2, 90
LDI r3, 200
LINE r0, r1, r2, r3, r5

; Fill left mountain body
LDI r0, 10
LDI r1, 160
LDI r2, 60
LDI r3, 40
LDI r4, 0x1A0A2A
RECTF r0, r1, r2, r3, r4

; Center mountain: peak (140, 120), base (80, 200) to (210, 200)
LDI r0, 80
LDI r1, 200
LDI r2, 140
LDI r3, 120
LINE r0, r1, r2, r3, r5

LDI r0, 140
LDI r1, 120
LDI r2, 210
LDI r3, 200
LINE r0, r1, r2, r3, r5

LDI r0, 80
LDI r1, 200
LDI r2, 210
LDI r3, 200
LINE r0, r1, r2, r3, r5

; Fill center mountain body
LDI r0, 100
LDI r1, 140
LDI r2, 80
LDI r3, 60
LDI r4, 0x1A0A2A
RECTF r0, r1, r2, r3, r4

; Right mountain: peak (220, 150), base (180, 200) to (256, 200)
LDI r0, 180
LDI r1, 200
LDI r2, 220
LDI r3, 150
LINE r0, r1, r2, r3, r5

LDI r0, 220
LDI r1, 150
LDI r2, 256
LDI r3, 200
LINE r0, r1, r2, r3, r5

LDI r0, 180
LDI r1, 200
LDI r2, 256
LDI r3, 200
LINE r0, r1, r2, r3, r5

; Fill right mountain body
LDI r0, 190
LDI r1, 165
LDI r2, 60
LDI r3, 35
LDI r4, 0x1A0A2A
RECTF r0, r1, r2, r3, r4

; Lake area: dark blue-teal overlay at bottom
LDI r0, 0
LDI r1, 200
LDI r2, 256
LDI r3, 56
LDI r4, 0x0A1128
RECTF r0, r1, r2, r3, r4

; Sun reflection in lake: vertical streak
LDI r0, 124
LDI r1, 200
LDI r2, 8
LDI r3, 50
LDI r4, 0x664400
RECTF r0, r1, r2, r3, r4

LDI r0, 126
LDI r1, 200
LDI r2, 4
LDI r3, 40
LDI r4, 0x996600
RECTF r0, r1, r2, r3, r4

; Stars in upper sky
LDI r3, 0xFFFFFF
LDI r0, 20
LDI r1, 15
PSET r0, r1, r3

LDI r0, 180
LDI r1, 25
PSET r0, r1, r3

LDI r0, 230
LDI r1, 10
PSET r0, r1, r3

LDI r0, 100
LDI r1, 40
PSET r0, r1, r3

LDI r0, 55
LDI r1, 50
PSET r0, r1, r3

LDI r0, 210
LDI r1, 55
PSET r0, r1, r3

LDI r0, 15
LDI r1, 70
PSET r0, r1, r3

LDI r0, 245
LDI r1, 80
PSET r0, r1, r3

HALT
