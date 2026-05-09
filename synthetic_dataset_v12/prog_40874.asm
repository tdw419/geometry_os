; DESCRIPTION: Draws a purple line from (260, 172) to (286, 161).
; PLAN: r0=260(x1), r1=172(y1), r2=286(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 172
LDI r2, 286
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
