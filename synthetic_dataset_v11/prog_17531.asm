; DESCRIPTION: Renders a blue line between points (5, 193) and (213, 211).
; PLAN: r0=5(x1), r1=193(y1), r2=213(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 193
LDI r2, 213
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
