; DESCRIPTION: Places a magenta line segment connecting (369, 83) to (9, 32).
; PLAN: r0=369(x1), r1=83(y1), r2=9(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 83
LDI r2, 9
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
