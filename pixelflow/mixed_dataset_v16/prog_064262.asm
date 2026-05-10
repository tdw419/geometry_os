; DESCRIPTION: Renders a blue rectangular region spanning 20 by 100 at (319, 160).
; PLAN: r0=319(x), r1=160(y), r2=20(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 160
LDI r2, 20
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
