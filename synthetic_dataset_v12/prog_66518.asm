; DESCRIPTION: Places a magenta line segment connecting (462, 32) to (234, 211).
; PLAN: r0=462(x1), r1=32(y1), r2=234(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 32
LDI r2, 234
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
