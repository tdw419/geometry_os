; DESCRIPTION: Renders a purple line between points (105, 91) and (79, 160).
; PLAN: r0=105(x1), r1=91(y1), r2=79(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 91
LDI r2, 79
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
