; DESCRIPTION: Places a blue line segment connecting (131, 175) to (195, 196).
; PLAN: r0=131(x1), r1=175(y1), r2=195(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 175
LDI r2, 195
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
