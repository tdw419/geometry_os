; DESCRIPTION: Places a white line segment connecting (137, 65) to (473, 69).
; PLAN: r0=137(x1), r1=65(y1), r2=473(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 65
LDI r2, 473
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
