; DESCRIPTION: Renders a white box of size 81x62 starting at (34, 147).
; PLAN: r0=34(x), r1=147(y), r2=81(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 147
LDI r2, 81
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
