; DESCRIPTION: Places a white line segment connecting (424, 11) to (226, 149).
; PLAN: r0=424(x1), r1=11(y1), r2=226(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 11
LDI r2, 226
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
