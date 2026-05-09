; DESCRIPTION: Draws a purple line from (209, 19) to (92, 100).
; PLAN: r0=209(x1), r1=19(y1), r2=92(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 19
LDI r2, 92
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
