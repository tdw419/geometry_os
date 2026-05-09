; DESCRIPTION: Renders a black box of size 11x29 starting at (52, 90).
; PLAN: r0=52(x), r1=90(y), r2=11(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 90
LDI r2, 11
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
