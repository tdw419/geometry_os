; DESCRIPTION: Places a magenta line segment connecting (177, 49) to (63, 53).
; PLAN: r0=177(x1), r1=49(y1), r2=63(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 49
LDI r2, 63
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
