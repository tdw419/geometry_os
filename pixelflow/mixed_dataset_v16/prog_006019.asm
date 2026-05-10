; DESCRIPTION: Renders a white box of size 14x101 starting at (414, 155).
; PLAN: r0=414(x), r1=155(y), r2=14(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 155
LDI r2, 14
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
