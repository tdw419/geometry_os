; DESCRIPTION: Places a magenta line segment connecting (395, 168) to (420, 89).
; PLAN: r0=395(x1), r1=168(y1), r2=420(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 168
LDI r2, 420
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
