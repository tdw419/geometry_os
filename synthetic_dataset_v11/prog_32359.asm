; DESCRIPTION: Draws a purple line from (61, 247) to (103, 20).
; PLAN: r0=61(x1), r1=247(y1), r2=103(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 247
LDI r2, 103
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
