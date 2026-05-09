; DESCRIPTION: Draws a blue line from (416, 140) to (253, 245).
; PLAN: r0=416(x1), r1=140(y1), r2=253(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 140
LDI r2, 253
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
