; DESCRIPTION: Places a orange 89x99 rectangle at position (54, 105).
; PLAN: r0=54(x), r1=105(y), r2=89(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 105
LDI r2, 89
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
