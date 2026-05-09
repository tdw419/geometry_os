; DESCRIPTION: Places a blue line segment connecting (278, 144) to (21, 214).
; PLAN: r0=278(x1), r1=144(y1), r2=21(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 144
LDI r2, 21
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
