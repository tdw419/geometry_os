; DESCRIPTION: Places a white line segment connecting (65, 65) to (46, 1).
; PLAN: r0=65(x1), r1=65(y1), r2=46(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 65
LDI r2, 46
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
