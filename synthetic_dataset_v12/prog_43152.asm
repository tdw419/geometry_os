; DESCRIPTION: Places a magenta line segment connecting (242, 183) to (266, 217).
; PLAN: r0=242(x1), r1=183(y1), r2=266(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 183
LDI r2, 266
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
