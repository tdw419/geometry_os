; DESCRIPTION: Renders a green rectangular region spanning 31 by 43 at (207, 63).
; PLAN: r0=207(x), r1=63(y), r2=31(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 63
LDI r2, 31
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
