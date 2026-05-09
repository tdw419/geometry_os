; DESCRIPTION: Renders a yellow box of size 68x88 starting at (129, 13).
; PLAN: r0=129(x), r1=13(y), r2=68(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 13
LDI r2, 68
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
