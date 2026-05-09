; DESCRIPTION: Places a magenta line segment connecting (236, 233) to (222, 92).
; PLAN: r0=236(x1), r1=233(y1), r2=222(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 233
LDI r2, 222
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
