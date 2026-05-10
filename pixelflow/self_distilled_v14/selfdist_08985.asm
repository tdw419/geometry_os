; DESCRIPTION: Draws a purple line from (115, 109) to (123, 7).
; PLAN: r0=115(x1), r1=109(y1), r2=123(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 109
LDI r2, 123
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
