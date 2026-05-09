; DESCRIPTION: Places a magenta line segment connecting (256, 21) to (252, 22).
; PLAN: r0=256(x1), r1=21(y1), r2=252(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 21
LDI r2, 252
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
