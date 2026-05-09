; DESCRIPTION: Renders a blue line between points (198, 31) and (112, 39).
; PLAN: r0=198(x1), r1=31(y1), r2=112(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 31
LDI r2, 112
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
