; DESCRIPTION: Places a magenta line segment connecting (491, 123) to (405, 36).
; PLAN: r0=491(x1), r1=123(y1), r2=405(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 123
LDI r2, 405
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
