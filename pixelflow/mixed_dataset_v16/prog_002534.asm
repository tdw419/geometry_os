; DESCRIPTION: Places a white line segment connecting (367, 200) to (411, 49).
; PLAN: r0=367(x1), r1=200(y1), r2=411(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 200
LDI r2, 411
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
