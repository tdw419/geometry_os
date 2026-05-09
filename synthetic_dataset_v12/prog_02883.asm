; DESCRIPTION: Places a magenta line segment connecting (164, 29) to (70, 220).
; PLAN: r0=164(x1), r1=29(y1), r2=70(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 29
LDI r2, 70
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
