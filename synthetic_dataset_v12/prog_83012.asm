; DESCRIPTION: Places a cyan line segment connecting (507, 157) to (21, 26).
; PLAN: r0=507(x1), r1=157(y1), r2=21(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 157
LDI r2, 21
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
