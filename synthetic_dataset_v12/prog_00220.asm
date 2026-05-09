; DESCRIPTION: Renders a blue line between points (97, 65) and (263, 211).
; PLAN: r0=97(x1), r1=65(y1), r2=263(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 65
LDI r2, 263
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
