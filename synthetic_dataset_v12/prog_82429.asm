; DESCRIPTION: Places a magenta line segment connecting (280, 247) to (444, 34).
; PLAN: r0=280(x1), r1=247(y1), r2=444(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 247
LDI r2, 444
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
