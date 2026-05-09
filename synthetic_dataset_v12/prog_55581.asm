; DESCRIPTION: Places a magenta line segment connecting (191, 233) to (165, 211).
; PLAN: r0=191(x1), r1=233(y1), r2=165(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 233
LDI r2, 165
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
