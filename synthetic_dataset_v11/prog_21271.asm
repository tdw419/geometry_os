; DESCRIPTION: Draws a purple line from (171, 150) to (174, 96).
; PLAN: r0=171(x1), r1=150(y1), r2=174(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 150
LDI r2, 174
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
