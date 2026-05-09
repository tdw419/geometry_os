; DESCRIPTION: Places a cyan line segment connecting (15, 227) to (172, 220).
; PLAN: r0=15(x1), r1=227(y1), r2=172(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 227
LDI r2, 172
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
