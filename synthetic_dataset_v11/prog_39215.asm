; DESCRIPTION: Places a orange 33x110 rectangle at position (97, 89).
; PLAN: r0=97(x), r1=89(y), r2=33(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 89
LDI r2, 33
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
