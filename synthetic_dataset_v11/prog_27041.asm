; DESCRIPTION: Renders a blue line between points (196, 165) and (82, 147).
; PLAN: r0=196(x1), r1=165(y1), r2=82(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 165
LDI r2, 82
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
