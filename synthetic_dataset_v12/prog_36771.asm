; DESCRIPTION: Draws a purple line from (131, 53) to (140, 150).
; PLAN: r0=131(x1), r1=53(y1), r2=140(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 53
LDI r2, 140
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
