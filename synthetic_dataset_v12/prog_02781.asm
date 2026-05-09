; DESCRIPTION: Draws a purple line from (123, 245) to (427, 159).
; PLAN: r0=123(x1), r1=245(y1), r2=427(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 245
LDI r2, 427
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
