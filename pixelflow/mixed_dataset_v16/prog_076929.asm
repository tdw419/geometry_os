; DESCRIPTION: Places a magenta line segment connecting (447, 214) to (78, 255).
; PLAN: r0=447(x1), r1=214(y1), r2=78(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 214
LDI r2, 78
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
