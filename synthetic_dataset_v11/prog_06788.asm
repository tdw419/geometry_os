; DESCRIPTION: Places a blue line segment connecting (225, 96) to (4, 50).
; PLAN: r0=225(x1), r1=96(y1), r2=4(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 96
LDI r2, 4
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
