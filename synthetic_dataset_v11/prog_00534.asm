; DESCRIPTION: Places a blue line segment connecting (35, 221) to (225, 80).
; PLAN: r0=35(x1), r1=221(y1), r2=225(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 221
LDI r2, 225
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
