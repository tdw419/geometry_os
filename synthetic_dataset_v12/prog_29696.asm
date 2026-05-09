; DESCRIPTION: Places a magenta line segment connecting (72, 30) to (474, 128).
; PLAN: r0=72(x1), r1=30(y1), r2=474(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 30
LDI r2, 474
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
