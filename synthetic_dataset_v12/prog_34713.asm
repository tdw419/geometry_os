; DESCRIPTION: Renders a orange box of size 31x119 starting at (37, 96).
; PLAN: r0=37(x), r1=96(y), r2=31(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 96
LDI r2, 31
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
