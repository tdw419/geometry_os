; DESCRIPTION: Places a magenta line segment connecting (77, 209) to (225, 129).
; PLAN: r0=77(x1), r1=209(y1), r2=225(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 209
LDI r2, 225
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
