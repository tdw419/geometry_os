; DESCRIPTION: Places a blue line segment connecting (116, 193) to (54, 240).
; PLAN: r0=116(x1), r1=193(y1), r2=54(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 193
LDI r2, 54
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
