; DESCRIPTION: Creates a orange filled rectangle of size 73x83 starting at (110, 13).
; PLAN: r0=110(x), r1=13(y), r2=73(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 13
LDI r2, 73
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
