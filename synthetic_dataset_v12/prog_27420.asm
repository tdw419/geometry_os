; DESCRIPTION: Places a magenta line segment connecting (356, 150) to (72, 64).
; PLAN: r0=356(x1), r1=150(y1), r2=72(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 150
LDI r2, 72
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
