; DESCRIPTION: Places a blue line segment connecting (253, 240) to (96, 223).
; PLAN: r0=253(x1), r1=240(y1), r2=96(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 240
LDI r2, 96
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
