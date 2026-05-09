; DESCRIPTION: Renders a black box of size 11x17 starting at (62, 59).
; PLAN: r0=62(x), r1=59(y), r2=11(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 59
LDI r2, 11
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
