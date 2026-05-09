; DESCRIPTION: Renders a yellow box of size 93x63 starting at (106, 72).
; PLAN: r0=106(x), r1=72(y), r2=93(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 72
LDI r2, 93
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
