; DESCRIPTION: Places a magenta line segment connecting (463, 152) to (49, 185).
; PLAN: r0=463(x1), r1=152(y1), r2=49(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 152
LDI r2, 49
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
