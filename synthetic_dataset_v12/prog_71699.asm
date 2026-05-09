; DESCRIPTION: Places a magenta line segment connecting (404, 218) to (105, 224).
; PLAN: r0=404(x1), r1=218(y1), r2=105(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 218
LDI r2, 105
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
