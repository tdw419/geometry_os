; DESCRIPTION: Draws a purple line from (18, 2) to (178, 212).
; PLAN: r0=18(x1), r1=2(y1), r2=178(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 2
LDI r2, 178
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
