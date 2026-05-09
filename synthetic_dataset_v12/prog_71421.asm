; DESCRIPTION: Places a white line segment connecting (286, 101) to (357, 125).
; PLAN: r0=286(x1), r1=101(y1), r2=357(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 101
LDI r2, 357
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
