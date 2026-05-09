; DESCRIPTION: Places a magenta line segment connecting (367, 188) to (70, 74).
; PLAN: r0=367(x1), r1=188(y1), r2=70(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 188
LDI r2, 70
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
