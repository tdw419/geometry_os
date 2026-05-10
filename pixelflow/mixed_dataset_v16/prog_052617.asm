; DESCRIPTION: Renders a yellow box of size 71x88 starting at (200, 31).
; PLAN: r0=200(x), r1=31(y), r2=71(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 31
LDI r2, 71
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
