; DESCRIPTION: Places a magenta line segment connecting (183, 135) to (165, 211).
; PLAN: r0=183(x1), r1=135(y1), r2=165(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 135
LDI r2, 165
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
