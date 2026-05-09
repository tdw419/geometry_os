; DESCRIPTION: Places a magenta line segment connecting (27, 169) to (189, 82).
; PLAN: r0=27(x1), r1=169(y1), r2=189(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 169
LDI r2, 189
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
