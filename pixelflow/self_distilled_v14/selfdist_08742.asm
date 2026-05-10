; DESCRIPTION: Draws a purple line from (355, 103) to (1, 32).
; PLAN: r0=355(x1), r1=103(y1), r2=1(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 103
LDI r2, 1
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
