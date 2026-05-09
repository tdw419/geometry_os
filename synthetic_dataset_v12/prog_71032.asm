; DESCRIPTION: Places a blue line segment connecting (225, 183) to (249, 192).
; PLAN: r0=225(x1), r1=183(y1), r2=249(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 183
LDI r2, 249
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
