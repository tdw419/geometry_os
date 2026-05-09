; DESCRIPTION: Places a magenta line segment connecting (104, 75) to (68, 108).
; PLAN: r0=104(x1), r1=75(y1), r2=68(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 75
LDI r2, 68
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
