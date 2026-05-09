; DESCRIPTION: Places a magenta line segment connecting (59, 74) to (475, 119).
; PLAN: r0=59(x1), r1=74(y1), r2=475(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 74
LDI r2, 475
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
