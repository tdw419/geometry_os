; DESCRIPTION: Places a white line segment connecting (369, 163) to (510, 183).
; PLAN: r0=369(x1), r1=163(y1), r2=510(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 163
LDI r2, 510
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
