; DESCRIPTION: Places a white line segment connecting (240, 20) to (169, 46).
; PLAN: r0=240(x1), r1=20(y1), r2=169(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 20
LDI r2, 169
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
