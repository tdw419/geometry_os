; DESCRIPTION: Renders a yellow box of size 24x101 starting at (324, 102).
; PLAN: r0=324(x), r1=102(y), r2=24(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 102
LDI r2, 24
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
