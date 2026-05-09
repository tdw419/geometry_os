; DESCRIPTION: Draws a blue line from (208, 189) to (94, 211).
; PLAN: r0=208(x1), r1=189(y1), r2=94(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 189
LDI r2, 94
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
