; DESCRIPTION: Places a white line segment connecting (71, 40) to (291, 109).
; PLAN: r0=71(x1), r1=40(y1), r2=291(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 40
LDI r2, 291
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
