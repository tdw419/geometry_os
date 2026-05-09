; DESCRIPTION: Draws a purple line from (368, 13) to (300, 180).
; PLAN: r0=368(x1), r1=13(y1), r2=300(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 13
LDI r2, 300
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
