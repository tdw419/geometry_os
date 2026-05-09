; DESCRIPTION: Renders a black box of size 107x119 starting at (47, 115).
; PLAN: r0=47(x), r1=115(y), r2=107(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 115
LDI r2, 107
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
