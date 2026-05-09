; DESCRIPTION: Places a white line segment connecting (140, 178) to (76, 68).
; PLAN: r0=140(x1), r1=178(y1), r2=76(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 178
LDI r2, 76
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
