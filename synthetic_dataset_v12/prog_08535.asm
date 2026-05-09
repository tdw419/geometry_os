; DESCRIPTION: Renders a black box of size 55x119 starting at (274, 36).
; PLAN: r0=274(x), r1=36(y), r2=55(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 36
LDI r2, 55
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
