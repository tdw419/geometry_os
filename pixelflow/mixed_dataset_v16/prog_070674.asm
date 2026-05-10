; DESCRIPTION: Places a white line segment connecting (355, 87) to (220, 175).
; PLAN: r0=355(x1), r1=87(y1), r2=220(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 87
LDI r2, 220
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
