; DESCRIPTION: Draws a purple line from (154, 113) to (221, 2).
; PLAN: r0=154(x1), r1=113(y1), r2=221(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 113
LDI r2, 221
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
