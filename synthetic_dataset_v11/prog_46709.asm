; DESCRIPTION: Places a magenta line segment connecting (185, 150) to (64, 233).
; PLAN: r0=185(x1), r1=150(y1), r2=64(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 150
LDI r2, 64
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
