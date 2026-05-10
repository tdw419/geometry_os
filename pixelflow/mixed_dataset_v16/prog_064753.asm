; DESCRIPTION: Places a magenta line segment connecting (302, 42) to (229, 99).
; PLAN: r0=302(x1), r1=42(y1), r2=229(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 42
LDI r2, 229
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
