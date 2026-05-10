; DESCRIPTION: Creates a orange filled rectangle of size 107x34 starting at (115, 2).
; PLAN: r0=115(x), r1=2(y), r2=107(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 2
LDI r2, 107
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
