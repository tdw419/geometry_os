; DESCRIPTION: Draws a purple line from (159, 27) to (106, 119).
; PLAN: r0=159(x1), r1=27(y1), r2=106(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 27
LDI r2, 106
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
