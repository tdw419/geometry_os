; DESCRIPTION: Places a white line segment connecting (391, 143) to (303, 78).
; PLAN: r0=391(x1), r1=143(y1), r2=303(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 143
LDI r2, 303
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
