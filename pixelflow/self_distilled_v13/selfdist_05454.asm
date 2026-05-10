; DESCRIPTION: Renders a green rectangular region spanning 84 by 102 at (199, 155).
; PLAN: r0=199(x), r1=155(y), r2=84(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 155
LDI r2, 84
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
