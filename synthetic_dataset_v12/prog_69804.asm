; DESCRIPTION: Places a magenta line segment connecting (23, 229) to (185, 83).
; PLAN: r0=23(x1), r1=229(y1), r2=185(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 229
LDI r2, 185
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
