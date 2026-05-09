; DESCRIPTION: Places a magenta line segment connecting (85, 107) to (190, 189).
; PLAN: r0=85(x1), r1=107(y1), r2=190(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 107
LDI r2, 190
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
