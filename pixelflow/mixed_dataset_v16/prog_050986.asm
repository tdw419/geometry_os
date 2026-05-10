; DESCRIPTION: Renders a green rectangular region spanning 23 by 19 at (309, 78).
; PLAN: r0=309(x), r1=78(y), r2=23(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 78
LDI r2, 23
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
