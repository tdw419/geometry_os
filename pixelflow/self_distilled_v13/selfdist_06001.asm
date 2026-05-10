; DESCRIPTION: Renders a blue rectangular region spanning 78 by 97 at (9, 46).
; PLAN: r0=9(x), r1=46(y), r2=78(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 46
LDI r2, 78
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
