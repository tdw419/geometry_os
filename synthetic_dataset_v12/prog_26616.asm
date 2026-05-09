; DESCRIPTION: Draws a purple line from (154, 92) to (29, 21).
; PLAN: r0=154(x1), r1=92(y1), r2=29(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 92
LDI r2, 29
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
