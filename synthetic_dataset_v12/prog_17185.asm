; DESCRIPTION: Draws a purple line from (171, 78) to (315, 141).
; PLAN: r0=171(x1), r1=78(y1), r2=315(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 78
LDI r2, 315
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
