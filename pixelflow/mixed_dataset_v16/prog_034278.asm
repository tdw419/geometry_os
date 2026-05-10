; DESCRIPTION: Renders a yellow box of size 80x13 starting at (212, 156).
; PLAN: r0=212(x), r1=156(y), r2=80(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 156
LDI r2, 80
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
