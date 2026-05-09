; DESCRIPTION: Places a magenta line segment connecting (189, 230) to (183, 47).
; PLAN: r0=189(x1), r1=230(y1), r2=183(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 230
LDI r2, 183
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
