; DESCRIPTION: Draws a blue line from (67, 193) to (334, 131).
; PLAN: r0=67(x1), r1=193(y1), r2=334(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 193
LDI r2, 334
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
