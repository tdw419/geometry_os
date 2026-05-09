; DESCRIPTION: Places a cyan line segment connecting (505, 217) to (443, 78).
; PLAN: r0=505(x1), r1=217(y1), r2=443(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 217
LDI r2, 443
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
