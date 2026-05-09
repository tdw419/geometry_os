; DESCRIPTION: Places a green line segment connecting (507, 205) to (437, 35).
; PLAN: r0=507(x1), r1=205(y1), r2=437(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 205
LDI r2, 437
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
