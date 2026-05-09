; DESCRIPTION: Renders a yellow box of size 115x15 starting at (324, 144).
; PLAN: r0=324(x), r1=144(y), r2=115(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 144
LDI r2, 115
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
