; DESCRIPTION: Draws a purple line from (87, 22) to (125, 221).
; PLAN: r0=87(x1), r1=22(y1), r2=125(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 22
LDI r2, 125
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
