; 029_color_wheel.asm -- Color wheel: 36 radial lines from center with rainbow colors

; Black background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4

; Center
LDI r5, 128
LDI r6, 128

; Line 0: angle=0, end=(128,8) color red
LDI r0, 128
LDI r1, 8
LDI r4, 0xFF0000
LINE r5, r6, r0, r1, r4

; Line 1: angle=10, end=(150,14)
LDI r0, 150
LDI r1, 14
LDI r4, 0xFF4400
LINE r5, r6, r0, r1, r4

; Line 2: angle=20, end=(168,26)
LDI r0, 168
LDI r1, 26
LDI r4, 0xFF8800
LINE r5, r6, r0, r1, r4

; Line 3: angle=30, end=(183,44)
LDI r0, 183
LDI r1, 44
LDI r4, 0xFFBB00
LINE r5, r6, r0, r1, r4

; Line 4: angle=40, end=(194,65)
LDI r0, 194
LDI r1, 65
LDI r4, 0xFFFF00
LINE r5, r6, r0, r1, r4

; Line 5: angle=50, end=(200,90)
LDI r0, 200
LDI r1, 90
LDI r4, 0x88FF00
LINE r5, r6, r0, r1, r4

; Line 6: angle=60, end=(200,118)
LDI r0, 200
LDI r1, 118
LDI r4, 0x00FF00
LINE r5, r6, r0, r1, r4

; Line 7: angle=70, end=(194,145)
LDI r0, 194
LDI r1, 145
LDI r4, 0x00FF88
LINE r5, r6, r0, r1, r4

; Line 8: angle=80, end=(183,168)
LDI r0, 183
LDI r1, 168
LDI r4, 0x00FFBB
LINE r5, r6, r0, r1, r4

; Line 9: angle=90, end=(168,188)
LDI r0, 168
LDI r1, 188
LDI r4, 0x00FFFF
LINE r5, r6, r0, r1, r4

; Line 10: angle=100, end=(150,204)
LDI r0, 150
LDI r1, 204
LDI r4, 0x0088FF
LINE r5, r6, r0, r1, r4

; Line 11: angle=110, end=(128,214)
LDI r0, 128
LDI r1, 214
LDI r4, 0x0044FF
LINE r5, r6, r0, r1, r4

; Line 12: angle=120, end=(106,220)
LDI r0, 106
LDI r1, 220
LDI r4, 0x0000FF
LINE r5, r6, r0, r1, r4

; Line 13: angle=130, end=(83,220)
LDI r0, 83
LDI r1, 220
LDI r4, 0x4400FF
LINE r5, r6, r0, r1, r4

; Line 14: angle=140, end=(62,214)
LDI r0, 62
LDI r1, 214
LDI r4, 0x8800FF
LINE r5, r6, r0, r1, r4

; Line 15: angle=150, end=(44,204)
LDI r0, 44
LDI r1, 204
LDI r4, 0xBB00FF
LINE r5, r6, r0, r1, r4

; Line 16: angle=160, end=(29,188)
LDI r0, 29
LDI r1, 188
LDI r4, 0xFF00FF
LINE r5, r6, r0, r1, r4

; Line 17: angle=170, end=(18,168)
LDI r0, 18
LDI r1, 168
LDI r4, 0xFF00BB
LINE r5, r6, r0, r1, r4

; Line 18: angle=180, end=(14,145)
LDI r0, 14
LDI r1, 145
LDI r4, 0xFF0088
LINE r5, r6, r0, r1, r4

; Line 19: angle=190, end=(14,118)
LDI r0, 14
LDI r1, 118
LDI r4, 0xFF0044
LINE r5, r6, r0, r1, r4

; Line 20: angle=200, end=(18,90)
LDI r0, 18
LDI r1, 90
LDI r4, 0xFF0000
LINE r5, r6, r0, r1, r4

; Line 21: angle=210, end=(29,65)
LDI r0, 29
LDI r1, 65
LDI r4, 0xFF4400
LINE r5, r6, r0, r1, r4

; Line 22: angle=220, end=(44,44)
LDI r0, 44
LDI r1, 44
LDI r4, 0xFF8800
LINE r5, r6, r0, r1, r4

; Line 23: angle=230, end=(62,26)
LDI r0, 62
LDI r1, 26
LDI r4, 0xFFBB00
LINE r5, r6, r0, r1, r4

; Line 24: angle=240, end=(83,14)
LDI r0, 83
LDI r1, 14
LDI r4, 0xFFFF00
LINE r5, r6, r0, r1, r4

; Line 25: angle=250, end=(106,8)
LDI r0, 106
LDI r1, 8
LDI r4, 0x88FF00
LINE r5, r6, r0, r1, r4

; White center dot
LDI r0, 124
LDI r1, 124
LDI r2, 8
LDI r3, 8
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

HALT
