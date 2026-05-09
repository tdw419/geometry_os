; DESCRIPTION: Places a white line segment connecting (369, 141) to (326, 39).
; PLAN: r0=369(x1), r1=141(y1), r2=326(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 141
LDI r2, 326
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
