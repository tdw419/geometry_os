; DESCRIPTION: Places a magenta line segment connecting (444, 30) to (404, 227).
; PLAN: r0=444(x1), r1=30(y1), r2=404(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 30
LDI r2, 404
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
