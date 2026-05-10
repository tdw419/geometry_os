; DESCRIPTION: Places a orange 70x26 box at position (222, 97).
; PLAN: r0=222(x), r1=97(y), r2=70(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 97
LDI r2, 70
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
