; DESCRIPTION: Renders a yellow box of size 11x62 starting at (136, 8).
; PLAN: r0=136(x), r1=8(y), r2=11(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 8
LDI r2, 11
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
