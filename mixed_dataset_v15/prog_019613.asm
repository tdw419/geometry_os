; DESCRIPTION: Places a white line segment connecting (140, 106) to (375, 208).
; PLAN: r0=140(x1), r1=106(y1), r2=375(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 106
LDI r2, 375
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
