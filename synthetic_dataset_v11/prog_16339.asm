; DESCRIPTION: Places a white line segment connecting (68, 66) to (175, 9).
; PLAN: r0=68(x1), r1=66(y1), r2=175(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 66
LDI r2, 175
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
