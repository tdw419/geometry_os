; DESCRIPTION: Places a yellow line segment connecting (177, 100) to (195, 167).
; PLAN: r0=177(x1), r1=100(y1), r2=195(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 100
LDI r2, 195
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
