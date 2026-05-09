; DESCRIPTION: Places a blue line segment connecting (126, 156) to (152, 109).
; PLAN: r0=126(x1), r1=156(y1), r2=152(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 156
LDI r2, 152
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
