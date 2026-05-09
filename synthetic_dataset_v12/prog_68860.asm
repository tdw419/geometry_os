; DESCRIPTION: Renders a yellow box of size 81x65 starting at (109, 163).
; PLAN: r0=109(x), r1=163(y), r2=81(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 163
LDI r2, 81
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
