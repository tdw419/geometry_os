; DESCRIPTION: Places a magenta line segment connecting (32, 145) to (160, 149).
; PLAN: r0=32(x1), r1=145(y1), r2=160(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 145
LDI r2, 160
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
