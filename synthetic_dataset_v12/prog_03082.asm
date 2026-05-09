; DESCRIPTION: Places a white line segment connecting (286, 245) to (290, 163).
; PLAN: r0=286(x1), r1=245(y1), r2=290(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 245
LDI r2, 290
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
