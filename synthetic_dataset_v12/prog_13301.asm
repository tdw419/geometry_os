; DESCRIPTION: Places a magenta line segment connecting (38, 218) to (405, 74).
; PLAN: r0=38(x1), r1=218(y1), r2=405(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 218
LDI r2, 405
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
