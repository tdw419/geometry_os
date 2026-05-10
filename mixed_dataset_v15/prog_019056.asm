; DESCRIPTION: Draws a white line from (507, 163) to (339, 254).
; PLAN: r0=507(x1), r1=163(y1), r2=339(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 163
LDI r2, 339
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
