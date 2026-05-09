; DESCRIPTION: Draws a purple line from (208, 98) to (141, 240).
; PLAN: r0=208(x1), r1=98(y1), r2=141(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 98
LDI r2, 141
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
