; DESCRIPTION: Places a magenta line segment connecting (395, 161) to (52, 142).
; PLAN: r0=395(x1), r1=161(y1), r2=52(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 161
LDI r2, 52
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
