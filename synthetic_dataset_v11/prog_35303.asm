; DESCRIPTION: Draws a purple line from (119, 109) to (206, 208).
; PLAN: r0=119(x1), r1=109(y1), r2=206(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 206
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
