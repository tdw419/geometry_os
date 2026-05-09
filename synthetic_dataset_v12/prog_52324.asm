; DESCRIPTION: Draws a purple line from (391, 70) to (171, 96).
; PLAN: r0=391(x1), r1=70(y1), r2=171(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 70
LDI r2, 171
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
