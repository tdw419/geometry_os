; DESCRIPTION: Renders a blue line between points (414, 212) and (65, 214).
; PLAN: r0=414(x1), r1=212(y1), r2=65(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 212
LDI r2, 65
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
