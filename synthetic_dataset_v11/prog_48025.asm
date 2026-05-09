; DESCRIPTION: Places a red line segment connecting (138, 165) to (67, 149).
; PLAN: r0=138(x1), r1=165(y1), r2=67(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 165
LDI r2, 67
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
