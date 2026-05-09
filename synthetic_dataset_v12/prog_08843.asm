; DESCRIPTION: Renders a yellow box of size 118x11 starting at (155, 27).
; PLAN: r0=155(x), r1=27(y), r2=118(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 27
LDI r2, 118
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
