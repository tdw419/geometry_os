; DESCRIPTION: Renders a yellow box of size 91x85 starting at (81, 144).
; PLAN: r0=81(x), r1=144(y), r2=91(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 144
LDI r2, 91
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
