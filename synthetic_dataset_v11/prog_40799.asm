; DESCRIPTION: Renders a blue line between points (130, 14) and (79, 172).
; PLAN: r0=130(x1), r1=14(y1), r2=79(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 14
LDI r2, 79
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
