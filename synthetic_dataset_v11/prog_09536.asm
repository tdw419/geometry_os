; DESCRIPTION: Places a magenta line segment connecting (13, 81) to (160, 45).
; PLAN: r0=13(x1), r1=81(y1), r2=160(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 81
LDI r2, 160
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
