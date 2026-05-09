; DESCRIPTION: Places a white line segment connecting (217, 211) to (251, 144).
; PLAN: r0=217(x1), r1=211(y1), r2=251(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 211
LDI r2, 251
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
