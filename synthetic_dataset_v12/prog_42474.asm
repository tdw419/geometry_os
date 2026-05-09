; DESCRIPTION: Draws a blue line from (68, 92) to (499, 35).
; PLAN: r0=68(x1), r1=92(y1), r2=499(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 92
LDI r2, 499
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
