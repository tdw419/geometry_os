; DESCRIPTION: Renders a purple line between points (79, 164) and (39, 254).
; PLAN: r0=79(x1), r1=164(y1), r2=39(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 164
LDI r2, 39
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
