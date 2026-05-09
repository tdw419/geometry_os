; DESCRIPTION: Places a magenta line segment connecting (461, 198) to (150, 117).
; PLAN: r0=461(x1), r1=198(y1), r2=150(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 198
LDI r2, 150
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
