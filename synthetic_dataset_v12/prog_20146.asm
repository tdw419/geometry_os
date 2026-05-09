; DESCRIPTION: Places a white line segment connecting (266, 0) to (319, 18).
; PLAN: r0=266(x1), r1=0(y1), r2=319(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 0
LDI r2, 319
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
