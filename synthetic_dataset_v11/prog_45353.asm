; DESCRIPTION: Places a blue line segment connecting (57, 81) to (202, 35).
; PLAN: r0=57(x1), r1=81(y1), r2=202(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 81
LDI r2, 202
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
