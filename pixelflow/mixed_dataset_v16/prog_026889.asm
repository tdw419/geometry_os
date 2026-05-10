; DESCRIPTION: Draws a white line from (357, 8) to (378, 88).
; PLAN: r0=357(x1), r1=8(y1), r2=378(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 8
LDI r2, 378
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
