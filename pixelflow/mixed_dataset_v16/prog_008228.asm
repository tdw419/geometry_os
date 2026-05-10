; DESCRIPTION: Places a green line segment connecting (19, 22) to (303, 54).
; PLAN: r0=19(x1), r1=22(y1), r2=303(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 22
LDI r2, 303
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
