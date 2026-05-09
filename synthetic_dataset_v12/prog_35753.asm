; DESCRIPTION: Places a white line segment connecting (355, 193) to (469, 40).
; PLAN: r0=355(x1), r1=193(y1), r2=469(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 193
LDI r2, 469
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
