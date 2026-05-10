; DESCRIPTION: Renders a green box of size 62x101 starting at (182, 75).
; PLAN: r0=182(x), r1=75(y), r2=62(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 75
LDI r2, 62
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
