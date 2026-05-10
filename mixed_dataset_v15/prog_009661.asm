; DESCRIPTION: Creates a orange filled rectangle of size 56x107 starting at (49, 20).
; PLAN: r0=49(x), r1=20(y), r2=56(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 20
LDI r2, 56
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
