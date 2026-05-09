; DESCRIPTION: Places a blue line segment connecting (13, 225) to (199, 55).
; PLAN: r0=13(x1), r1=225(y1), r2=199(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 225
LDI r2, 199
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
