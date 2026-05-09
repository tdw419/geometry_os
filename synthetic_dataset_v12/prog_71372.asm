; DESCRIPTION: Places a magenta line segment connecting (63, 178) to (280, 102).
; PLAN: r0=63(x1), r1=178(y1), r2=280(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 178
LDI r2, 280
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
