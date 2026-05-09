; DESCRIPTION: Renders a blue line between points (144, 36) and (204, 112).
; PLAN: r0=144(x1), r1=36(y1), r2=204(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 36
LDI r2, 204
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
