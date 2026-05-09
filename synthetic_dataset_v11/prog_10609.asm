; DESCRIPTION: Renders a blue line between points (229, 218) and (139, 209).
; PLAN: r0=229(x1), r1=218(y1), r2=139(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 218
LDI r2, 139
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
