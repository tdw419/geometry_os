; DESCRIPTION: Places a magenta line segment connecting (377, 252) to (256, 187).
; PLAN: r0=377(x1), r1=252(y1), r2=256(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 252
LDI r2, 256
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
