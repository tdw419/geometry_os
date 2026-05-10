; DESCRIPTION: Renders a purple line between points (428, 5) and (41, 204).
; PLAN: r0=428(x1), r1=5(y1), r2=41(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 5
LDI r2, 41
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
