; DESCRIPTION: Places a magenta line segment connecting (189, 147) to (91, 188).
; PLAN: r0=189(x1), r1=147(y1), r2=91(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 147
LDI r2, 91
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
