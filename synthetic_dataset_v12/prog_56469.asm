; DESCRIPTION: Places a white line segment connecting (369, 245) to (73, 71).
; PLAN: r0=369(x1), r1=245(y1), r2=73(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 245
LDI r2, 73
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
