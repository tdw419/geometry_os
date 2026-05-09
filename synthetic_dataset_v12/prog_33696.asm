; DESCRIPTION: Places a red line segment connecting (319, 46) to (3, 189).
; PLAN: r0=319(x1), r1=46(y1), r2=3(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 46
LDI r2, 3
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
