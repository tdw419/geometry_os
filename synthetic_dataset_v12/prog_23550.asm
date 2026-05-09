; DESCRIPTION: Places a magenta line segment connecting (459, 20) to (251, 36).
; PLAN: r0=459(x1), r1=20(y1), r2=251(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 20
LDI r2, 251
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
