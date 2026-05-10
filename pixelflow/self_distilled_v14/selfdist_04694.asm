; DESCRIPTION: Renders a green rectangular region spanning 54 by 35 at (306, 89).
; PLAN: r0=306(x), r1=89(y), r2=54(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 89
LDI r2, 54
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
