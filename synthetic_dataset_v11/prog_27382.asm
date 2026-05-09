; DESCRIPTION: Renders a blue line between points (213, 137) and (15, 181).
; PLAN: r0=213(x1), r1=137(y1), r2=15(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 137
LDI r2, 15
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
