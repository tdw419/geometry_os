; DESCRIPTION: Places a red line segment connecting (188, 86) to (124, 67).
; PLAN: r0=188(x1), r1=86(y1), r2=124(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 86
LDI r2, 124
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
