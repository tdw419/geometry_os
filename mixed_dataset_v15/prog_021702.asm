; DESCRIPTION: Creates a orange filled rectangle of size 43x74 starting at (115, 114).
; PLAN: r0=115(x), r1=114(y), r2=43(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 114
LDI r2, 43
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
