; DESCRIPTION: Places a magenta line segment connecting (32, 189) to (129, 45).
; PLAN: r0=32(x1), r1=189(y1), r2=129(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 189
LDI r2, 129
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
