; DESCRIPTION: Places a white line segment connecting (507, 103) to (341, 200).
; PLAN: r0=507(x1), r1=103(y1), r2=341(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 103
LDI r2, 341
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
