; DESCRIPTION: Places a blue line segment connecting (69, 225) to (82, 77).
; PLAN: r0=69(x1), r1=225(y1), r2=82(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 225
LDI r2, 82
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
