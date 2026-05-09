; DESCRIPTION: Draws a purple line from (328, 102) to (220, 92).
; PLAN: r0=328(x1), r1=102(y1), r2=220(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 102
LDI r2, 220
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
