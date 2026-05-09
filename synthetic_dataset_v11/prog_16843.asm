; DESCRIPTION: Places a red line segment connecting (175, 65) to (4, 89).
; PLAN: r0=175(x1), r1=65(y1), r2=4(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 65
LDI r2, 4
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
