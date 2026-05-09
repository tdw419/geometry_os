; DESCRIPTION: Draws a blue line from (116, 186) to (36, 118).
; PLAN: r0=116(x1), r1=186(y1), r2=36(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 186
LDI r2, 36
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
