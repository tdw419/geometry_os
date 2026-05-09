; DESCRIPTION: Places a blue line segment connecting (199, 80) to (57, 93).
; PLAN: r0=199(x1), r1=80(y1), r2=57(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 80
LDI r2, 57
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
