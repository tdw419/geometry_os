; DESCRIPTION: Places a magenta line segment connecting (60, 80) to (92, 226).
; PLAN: r0=60(x1), r1=80(y1), r2=92(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 80
LDI r2, 92
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
