; DESCRIPTION: Draws a purple line from (225, 9) to (208, 17).
; PLAN: r0=225(x1), r1=9(y1), r2=208(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 9
LDI r2, 208
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
