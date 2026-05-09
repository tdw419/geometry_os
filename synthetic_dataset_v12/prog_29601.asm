; DESCRIPTION: Places a white line segment connecting (412, 227) to (507, 186).
; PLAN: r0=412(x1), r1=227(y1), r2=507(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 227
LDI r2, 507
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
