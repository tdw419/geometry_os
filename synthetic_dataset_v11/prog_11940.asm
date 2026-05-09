; DESCRIPTION: Places a blue line segment connecting (6, 59) to (74, 214).
; PLAN: r0=6(x1), r1=59(y1), r2=74(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 59
LDI r2, 74
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
