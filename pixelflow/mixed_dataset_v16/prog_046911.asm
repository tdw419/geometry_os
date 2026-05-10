; DESCRIPTION: Draws a purple line from (12, 189) to (75, 141).
; PLAN: r0=12(x1), r1=189(y1), r2=75(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 189
LDI r2, 75
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
