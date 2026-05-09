; DESCRIPTION: Places a magenta line segment connecting (447, 236) to (260, 123).
; PLAN: r0=447(x1), r1=236(y1), r2=260(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 236
LDI r2, 260
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
