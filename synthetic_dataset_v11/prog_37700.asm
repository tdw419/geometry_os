; DESCRIPTION: Draws a purple line from (75, 53) to (233, 223).
; PLAN: r0=75(x1), r1=53(y1), r2=233(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 53
LDI r2, 233
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
