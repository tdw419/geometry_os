; DESCRIPTION: Places a magenta line segment connecting (42, 65) to (23, 200).
; PLAN: r0=42(x1), r1=65(y1), r2=23(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 65
LDI r2, 23
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
