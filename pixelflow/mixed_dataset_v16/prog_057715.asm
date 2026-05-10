; DESCRIPTION: Places a magenta line segment connecting (404, 199) to (211, 179).
; PLAN: r0=404(x1), r1=199(y1), r2=211(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 199
LDI r2, 211
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
