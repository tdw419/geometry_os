; DESCRIPTION: Places a magenta line segment connecting (129, 26) to (126, 40).
; PLAN: r0=129(x1), r1=26(y1), r2=126(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 26
LDI r2, 126
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
