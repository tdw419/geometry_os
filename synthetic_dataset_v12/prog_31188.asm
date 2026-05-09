; DESCRIPTION: Places a magenta line segment connecting (154, 11) to (404, 235).
; PLAN: r0=154(x1), r1=11(y1), r2=404(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 11
LDI r2, 404
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
