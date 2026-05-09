; DESCRIPTION: Places a green line segment connecting (70, 7) to (473, 104).
; PLAN: r0=70(x1), r1=7(y1), r2=473(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 7
LDI r2, 473
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
