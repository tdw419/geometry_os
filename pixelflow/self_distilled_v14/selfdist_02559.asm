; DESCRIPTION: Creates a orange filled rectangle of size 11x105 starting at (76, 62).
; PLAN: r0=76(x), r1=62(y), r2=11(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 62
LDI r2, 11
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
