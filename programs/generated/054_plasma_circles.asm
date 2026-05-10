; PLASMA -- Plasma effect with overlapping colored circles
; 4x4 grid, 3 concentric circles per position = 48 total circles
; Colors cycle through rainbow, overlapping creates plasma-like blend

; === Row 0, y=40 ===
; Position (40,40) - 3 radii
LDI r0, 40
LDI r1, 40
LDI r3, 0xFF0000
LDI r2, 30
CIRCLE r0, r1, r2, r3
LDI r2, 45
CIRCLE r0, r1, r2, r3
LDI r2, 60
CIRCLE r0, r1, r2, r3

; Position (100,40)
LDI r0, 100
LDI r3, 0xFF6600
LDI r2, 25
CIRCLE r0, r1, r2, r3
LDI r2, 40
CIRCLE r0, r1, r2, r3
LDI r2, 55
CIRCLE r0, r1, r2, r3

; Position (160,40)
LDI r0, 160
LDI r3, 0xFFFF00
LDI r2, 35
CIRCLE r0, r1, r2, r3
LDI r2, 50
CIRCLE r0, r1, r2, r3
LDI r2, 65
CIRCLE r0, r1, r2, r3

; Position (220,40)
LDI r0, 220
LDI r3, 0x88FF00
LDI r2, 28
CIRCLE r0, r1, r2, r3
LDI r2, 43
CIRCLE r0, r1, r2, r3
LDI r2, 58
CIRCLE r0, r1, r2, r3

; === Row 1, y=100 ===
LDI r0, 40
LDI r1, 100
LDI r3, 0x00FF00
LDI r2, 32
CIRCLE r0, r1, r2, r3
LDI r2, 48
CIRCLE r0, r1, r2, r3
LDI r2, 64
CIRCLE r0, r1, r2, r3

LDI r0, 100
LDI r3, 0x00FFAA
LDI r2, 27
CIRCLE r0, r1, r2, r3
LDI r2, 42
CIRCLE r0, r1, r2, r3
LDI r2, 57
CIRCLE r0, r1, r2, r3

LDI r0, 160
LDI r3, 0x00FFFF
LDI r2, 33
CIRCLE r0, r1, r2, r3
LDI r2, 49
CIRCLE r0, r1, r2, r3
LDI r2, 65
CIRCLE r0, r1, r2, r3

LDI r0, 220
LDI r3, 0x0088FF
LDI r2, 29
CIRCLE r0, r1, r2, r3
LDI r2, 44
CIRCLE r0, r1, r2, r3
LDI r2, 59
CIRCLE r0, r1, r2, r3

; === Row 2, y=160 ===
LDI r0, 40
LDI r1, 160
LDI r3, 0x0000FF
LDI r2, 30
CIRCLE r0, r1, r2, r3
LDI r2, 46
CIRCLE r0, r1, r2, r3
LDI r2, 62
CIRCLE r0, r1, r2, r3

LDI r0, 100
LDI r3, 0x8800FF
LDI r2, 26
CIRCLE r0, r1, r2, r3
LDI r2, 41
CIRCLE r0, r1, r2, r3
LDI r2, 56
CIRCLE r0, r1, r2, r3

LDI r0, 160
LDI r3, 0xFF00FF
LDI r2, 34
CIRCLE r0, r1, r2, r3
LDI r2, 50
CIRCLE r0, r1, r2, r3
LDI r2, 66
CIRCLE r0, r1, r2, r3

LDI r0, 220
LDI r3, 0xFF0088
LDI r2, 28
CIRCLE r0, r1, r2, r3
LDI r2, 43
CIRCLE r0, r1, r2, r3
LDI r2, 58
CIRCLE r0, r1, r2, r3

; === Row 3, y=220 ===
LDI r0, 40
LDI r1, 220
LDI r3, 0xFF0044
LDI r2, 31
CIRCLE r0, r1, r2, r3
LDI r2, 47
CIRCLE r0, r1, r2, r3
LDI r2, 63
CIRCLE r0, r1, r2, r3

LDI r0, 100
LDI r3, 0xFF4400
LDI r2, 25
CIRCLE r0, r1, r2, r3
LDI r2, 40
CIRCLE r0, r1, r2, r3
LDI r2, 55
CIRCLE r0, r1, r2, r3

LDI r0, 160
LDI r3, 0xFFAA00
LDI r2, 36
CIRCLE r0, r1, r2, r3
LDI r2, 52
CIRCLE r0, r1, r2, r3
LDI r2, 68
CIRCLE r0, r1, r2, r3

LDI r0, 220
LDI r3, 0xAAFF00
LDI r2, 29
CIRCLE r0, r1, r2, r3
LDI r2, 44
CIRCLE r0, r1, r2, r3
LDI r2, 59
CIRCLE r0, r1, r2, r3

HALT
