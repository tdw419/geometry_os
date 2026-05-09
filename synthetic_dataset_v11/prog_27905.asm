; DESCRIPTION: Places a magenta line segment connecting (188, 174) to (45, 220).
; PLAN: r0=188(x1), r1=174(y1), r2=45(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 174
LDI r2, 45
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
