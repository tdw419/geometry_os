; DESCRIPTION: Renders a yellow box of size 17x60 starting at (34, 22).
; PLAN: r0=34(x), r1=22(y), r2=17(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 22
LDI r2, 17
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
