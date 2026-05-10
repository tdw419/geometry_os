; DESCRIPTION: Places a magenta line segment connecting (164, 88) to (63, 120).
; PLAN: r0=164(x1), r1=88(y1), r2=63(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 88
LDI r2, 63
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
