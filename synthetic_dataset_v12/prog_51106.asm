; DESCRIPTION: Places a magenta line segment connecting (375, 152) to (462, 199).
; PLAN: r0=375(x1), r1=152(y1), r2=462(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 152
LDI r2, 462
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
