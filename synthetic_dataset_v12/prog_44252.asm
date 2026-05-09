; DESCRIPTION: Renders a green box of size 12x101 starting at (316, 2).
; PLAN: r0=316(x), r1=2(y), r2=12(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 2
LDI r2, 12
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
