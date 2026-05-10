; DESCRIPTION: Places a magenta line segment connecting (319, 232) to (413, 102).
; PLAN: r0=319(x1), r1=232(y1), r2=413(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 232
LDI r2, 413
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
