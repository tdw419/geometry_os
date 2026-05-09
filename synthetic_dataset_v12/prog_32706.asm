; DESCRIPTION: Places a white line segment connecting (355, 33) to (476, 166).
; PLAN: r0=355(x1), r1=33(y1), r2=476(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 33
LDI r2, 476
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
