; DESCRIPTION: Draws a purple line from (171, 158) to (18, 5).
; PLAN: r0=171(x1), r1=158(y1), r2=18(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 158
LDI r2, 18
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
