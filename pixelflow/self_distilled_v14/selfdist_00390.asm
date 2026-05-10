; DESCRIPTION: Creates a orange filled rectangle of size 57x22 starting at (211, 110).
; PLAN: r0=211(x), r1=110(y), r2=57(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 110
LDI r2, 57
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
