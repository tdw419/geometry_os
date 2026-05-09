; DESCRIPTION: Places a purple line segment connecting (405, 63) to (207, 89).
; PLAN: r0=405(x1), r1=63(y1), r2=207(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 63
LDI r2, 207
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
