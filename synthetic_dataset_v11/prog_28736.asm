; DESCRIPTION: Places a magenta line segment connecting (48, 222) to (181, 58).
; PLAN: r0=48(x1), r1=222(y1), r2=181(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 222
LDI r2, 181
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
