; DESCRIPTION: Renders a green box of size 20x43 starting at (68, 83).
; PLAN: r0=68(x), r1=83(y), r2=20(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 83
LDI r2, 20
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
