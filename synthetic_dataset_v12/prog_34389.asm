; DESCRIPTION: Places a magenta line segment connecting (385, 218) to (45, 209).
; PLAN: r0=385(x1), r1=218(y1), r2=45(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 218
LDI r2, 45
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
