; DESCRIPTION: Renders a yellow box of size 88x38 starting at (142, 39).
; PLAN: r0=142(x), r1=39(y), r2=88(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 39
LDI r2, 88
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
