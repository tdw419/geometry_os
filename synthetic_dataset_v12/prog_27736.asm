; DESCRIPTION: Renders a black box of size 11x36 starting at (2, 136).
; PLAN: r0=2(x), r1=136(y), r2=11(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 136
LDI r2, 11
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
