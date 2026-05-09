; DESCRIPTION: Places a red line segment connecting (67, 171) to (89, 175).
; PLAN: r0=67(x1), r1=171(y1), r2=89(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 171
LDI r2, 89
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
