; DESCRIPTION: Places a white line segment connecting (486, 106) to (175, 70).
; PLAN: r0=486(x1), r1=106(y1), r2=175(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 106
LDI r2, 175
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
