; DESCRIPTION: Places a magenta line segment connecting (83, 104) to (215, 247).
; PLAN: r0=83(x1), r1=104(y1), r2=215(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 104
LDI r2, 215
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
