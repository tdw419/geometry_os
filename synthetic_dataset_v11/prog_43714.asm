; DESCRIPTION: Places a white line segment connecting (248, 199) to (40, 125).
; PLAN: r0=248(x1), r1=199(y1), r2=40(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 199
LDI r2, 40
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
