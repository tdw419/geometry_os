; DESCRIPTION: Renders a yellow box of size 62x34 starting at (97, 219).
; PLAN: r0=97(x), r1=219(y), r2=62(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 219
LDI r2, 62
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
