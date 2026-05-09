; DESCRIPTION: Renders a green box of size 43x101 starting at (297, 56).
; PLAN: r0=297(x), r1=56(y), r2=43(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 56
LDI r2, 43
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
