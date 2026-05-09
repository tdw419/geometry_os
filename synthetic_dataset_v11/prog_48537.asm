; DESCRIPTION: Places a magenta line segment connecting (177, 183) to (189, 150).
; PLAN: r0=177(x1), r1=183(y1), r2=189(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 183
LDI r2, 189
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
