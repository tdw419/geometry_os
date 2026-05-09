; DESCRIPTION: Draws a purple line from (9, 38) to (208, 144).
; PLAN: r0=9(x1), r1=38(y1), r2=208(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 38
LDI r2, 208
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
