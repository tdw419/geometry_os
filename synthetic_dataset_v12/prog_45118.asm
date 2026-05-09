; DESCRIPTION: Places a blue line segment connecting (188, 212) to (173, 245).
; PLAN: r0=188(x1), r1=212(y1), r2=173(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 212
LDI r2, 173
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
