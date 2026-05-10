; DESCRIPTION: Draws a blue line from (278, 48) to (93, 67).
; PLAN: r0=278(x1), r1=48(y1), r2=93(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 48
LDI r2, 93
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
