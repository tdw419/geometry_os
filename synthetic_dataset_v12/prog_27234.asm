; DESCRIPTION: Places a red line segment connecting (406, 215) to (507, 72).
; PLAN: r0=406(x1), r1=215(y1), r2=507(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 215
LDI r2, 507
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
