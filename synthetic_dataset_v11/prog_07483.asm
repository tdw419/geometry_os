; DESCRIPTION: Renders a yellow box of size 10x24 starting at (155, 59).
; PLAN: r0=155(x), r1=59(y), r2=10(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 59
LDI r2, 10
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
