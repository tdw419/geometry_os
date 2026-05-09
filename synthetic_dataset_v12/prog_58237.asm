; DESCRIPTION: Renders a yellow box of size 39x119 starting at (163, 100).
; PLAN: r0=163(x), r1=100(y), r2=39(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 100
LDI r2, 39
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
