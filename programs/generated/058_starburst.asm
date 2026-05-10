; STARBURST -- 16 radial lines from center creating a sun/star pattern
; Alternating gold and red-orange lines on dark navy background
; White center circle

; Dark navy background
LDI r0, 0x0A0A1E
FILL r0

; Center coordinates
LDI r0, 128
LDI r1, 128

; Line 1: 0 degrees - gold
LDI r2, 248
LDI r3, 128
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 2: 22.5 degrees - red
LDI r2, 239
LDI r3, 82
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 3: 45 degrees - gold
LDI r2, 213
LDI r3, 43
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 4: 67.5 degrees - red
LDI r2, 174
LDI r3, 17
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 5: 90 degrees - gold
LDI r2, 128
LDI r3, 8
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 6: 112.5 degrees - red
LDI r2, 82
LDI r3, 17
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 7: 135 degrees - gold
LDI r2, 43
LDI r3, 43
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 8: 157.5 degrees - red
LDI r2, 17
LDI r3, 82
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 9: 180 degrees - gold
LDI r2, 8
LDI r3, 128
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 10: 202.5 degrees - red
LDI r2, 17
LDI r3, 174
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 11: 225 degrees - gold
LDI r2, 43
LDI r3, 213
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 12: 247.5 degrees - red
LDI r2, 82
LDI r3, 239
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 13: 270 degrees - gold
LDI r2, 128
LDI r3, 248
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 14: 292.5 degrees - red
LDI r2, 174
LDI r3, 239
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Line 15: 315 degrees - gold
LDI r2, 213
LDI r3, 213
LDI r4, 0xFFCC00
LINE r0, r1, r2, r3, r4

; Line 16: 337.5 degrees - red
LDI r2, 239
LDI r3, 174
LDI r4, 0xFF4400
LINE r0, r1, r2, r3, r4

; Center circle (white glow)
LDI r2, 12
LDI r3, 0xFFEE88
CIRCLE r0, r1, r2, r3

; Inner white circle
LDI r2, 6
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

HALT
