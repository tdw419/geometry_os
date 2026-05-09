; DESCRIPTION: Draws a purple line from (166, 159) to (400, 193).
; PLAN: r0=166(x1), r1=159(y1), r2=400(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 159
LDI r2, 400
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
