; DESCRIPTION: Renders a yellow box of size 62x93 starting at (155, 48).
; PLAN: r0=155(x), r1=48(y), r2=62(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 48
LDI r2, 62
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
