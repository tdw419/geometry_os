; DESCRIPTION: Renders a white box of size 30x119 starting at (306, 39).
; PLAN: r0=306(x), r1=39(y), r2=30(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 39
LDI r2, 30
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
