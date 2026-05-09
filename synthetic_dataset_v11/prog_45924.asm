; DESCRIPTION: Places a magenta line segment connecting (130, 104) to (234, 150).
; PLAN: r0=130(x1), r1=104(y1), r2=234(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 104
LDI r2, 234
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
