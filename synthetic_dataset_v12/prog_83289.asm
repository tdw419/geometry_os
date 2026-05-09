; DESCRIPTION: Renders a black box of size 74x119 starting at (276, 9).
; PLAN: r0=276(x), r1=9(y), r2=74(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 9
LDI r2, 74
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
