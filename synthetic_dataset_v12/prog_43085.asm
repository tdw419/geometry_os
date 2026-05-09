; DESCRIPTION: Places a magenta line segment connecting (185, 73) to (412, 36).
; PLAN: r0=185(x1), r1=73(y1), r2=412(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 73
LDI r2, 412
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
