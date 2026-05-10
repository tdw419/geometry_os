; DESCRIPTION: Places a orange 110x114 box at position (220, 83).
; PLAN: r0=220(x), r1=83(y), r2=110(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 83
LDI r2, 110
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
