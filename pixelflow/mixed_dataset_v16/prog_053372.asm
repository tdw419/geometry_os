; DESCRIPTION: Renders a blue line between points (399, 47) and (266, 188).
; PLAN: r0=399(x1), r1=47(y1), r2=266(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 47
LDI r2, 266
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
