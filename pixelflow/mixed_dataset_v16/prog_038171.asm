; DESCRIPTION: Renders a black box of size 11x105 starting at (15, 49).
; PLAN: r0=15(x), r1=49(y), r2=11(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 49
LDI r2, 11
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
