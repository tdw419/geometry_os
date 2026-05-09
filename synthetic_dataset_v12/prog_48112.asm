; DESCRIPTION: Renders a blue line between points (330, 177) and (198, 100).
; PLAN: r0=330(x1), r1=177(y1), r2=198(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 177
LDI r2, 198
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
