; DESCRIPTION: Renders a green box of size 74x101 starting at (109, 92).
; PLAN: r0=109(x), r1=92(y), r2=74(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 92
LDI r2, 74
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
