; DESCRIPTION: Places a magenta line segment connecting (199, 5) to (64, 160).
; PLAN: r0=199(x1), r1=5(y1), r2=64(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 5
LDI r2, 64
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
