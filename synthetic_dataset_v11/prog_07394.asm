; DESCRIPTION: Places a red line segment connecting (106, 54) to (90, 46).
; PLAN: r0=106(x1), r1=54(y1), r2=90(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 54
LDI r2, 90
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
