; DESCRIPTION: Places a magenta line segment connecting (334, 165) to (75, 47).
; PLAN: r0=334(x1), r1=165(y1), r2=75(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 165
LDI r2, 75
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
