; DESCRIPTION: Places a cyan line segment connecting (78, 178) to (119, 114).
; PLAN: r0=78(x1), r1=178(y1), r2=119(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 178
LDI r2, 119
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
