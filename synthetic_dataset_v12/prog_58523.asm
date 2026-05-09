; DESCRIPTION: Places a red line segment connecting (436, 25) to (106, 71).
; PLAN: r0=436(x1), r1=25(y1), r2=106(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 25
LDI r2, 106
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
