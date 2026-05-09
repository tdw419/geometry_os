; DESCRIPTION: Places a magenta line segment connecting (32, 45) to (19, 104).
; PLAN: r0=32(x1), r1=45(y1), r2=19(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 45
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
