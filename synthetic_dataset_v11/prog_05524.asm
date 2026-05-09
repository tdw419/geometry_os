; DESCRIPTION: Renders a green box of size 43x106 starting at (37, 71).
; PLAN: r0=37(x), r1=71(y), r2=43(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 71
LDI r2, 43
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
