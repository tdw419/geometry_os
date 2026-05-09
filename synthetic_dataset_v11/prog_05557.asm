; DESCRIPTION: Draws a purple line from (113, 100) to (113, 202).
; PLAN: r0=113(x1), r1=100(y1), r2=113(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 100
LDI r2, 113
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
