; DESCRIPTION: Renders a blue line between points (362, 17) and (427, 226).
; PLAN: r0=362(x1), r1=17(y1), r2=427(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 17
LDI r2, 427
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
