; DESCRIPTION: Renders a yellow box of size 63x22 starting at (93, 226).
; PLAN: r0=93(x), r1=226(y), r2=63(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 226
LDI r2, 63
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
