; DESCRIPTION: Draws a purple line from (259, 43) to (186, 162).
; PLAN: r0=259(x1), r1=43(y1), r2=186(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 43
LDI r2, 186
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
