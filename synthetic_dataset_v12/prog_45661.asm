; DESCRIPTION: Draws a blue line from (414, 20) to (129, 109).
; PLAN: r0=414(x1), r1=20(y1), r2=129(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 20
LDI r2, 129
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
