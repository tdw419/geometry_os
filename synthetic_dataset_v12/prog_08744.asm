; DESCRIPTION: Draws a blue line from (500, 183) to (414, 224).
; PLAN: r0=500(x1), r1=183(y1), r2=414(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 183
LDI r2, 414
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
