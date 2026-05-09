; DESCRIPTION: Places a magenta line segment connecting (283, 126) to (341, 19).
; PLAN: r0=283(x1), r1=126(y1), r2=341(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 126
LDI r2, 341
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
