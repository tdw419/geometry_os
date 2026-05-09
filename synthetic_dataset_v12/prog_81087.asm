; DESCRIPTION: Places a green line segment connecting (47, 117) to (369, 135).
; PLAN: r0=47(x1), r1=117(y1), r2=369(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 117
LDI r2, 369
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
