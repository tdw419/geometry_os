; DESCRIPTION: Places a magenta line segment connecting (18, 184) to (300, 37).
; PLAN: r0=18(x1), r1=184(y1), r2=300(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 184
LDI r2, 300
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
