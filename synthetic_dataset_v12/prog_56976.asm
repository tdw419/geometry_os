; DESCRIPTION: Places a cyan line segment connecting (251, 12) to (227, 161).
; PLAN: r0=251(x1), r1=12(y1), r2=227(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 12
LDI r2, 227
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
