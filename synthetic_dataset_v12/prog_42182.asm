; DESCRIPTION: Draws a purple line from (450, 247) to (416, 53).
; PLAN: r0=450(x1), r1=247(y1), r2=416(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 247
LDI r2, 416
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
