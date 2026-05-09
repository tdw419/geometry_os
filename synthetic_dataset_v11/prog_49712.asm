; DESCRIPTION: Places a white line segment connecting (165, 6) to (217, 105).
; PLAN: r0=165(x1), r1=6(y1), r2=217(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 6
LDI r2, 217
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
