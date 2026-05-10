; DESCRIPTION: Draws a purple line from (181, 173) to (427, 131).
; PLAN: r0=181(x1), r1=173(y1), r2=427(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 173
LDI r2, 427
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
