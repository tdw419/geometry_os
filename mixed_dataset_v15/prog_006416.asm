; DESCRIPTION: Draws a purple line from (246, 52) to (45, 18).
; PLAN: r0=246(x1), r1=52(y1), r2=45(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 52
LDI r2, 45
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
