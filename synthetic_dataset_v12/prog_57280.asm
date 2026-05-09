; DESCRIPTION: Places a blue line segment connecting (359, 109) to (175, 177).
; PLAN: r0=359(x1), r1=109(y1), r2=175(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 109
LDI r2, 175
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
