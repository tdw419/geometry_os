; DESCRIPTION: Places a white line segment connecting (486, 96) to (321, 129).
; PLAN: r0=486(x1), r1=96(y1), r2=321(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 96
LDI r2, 321
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
