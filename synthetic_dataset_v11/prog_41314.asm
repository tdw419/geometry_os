; DESCRIPTION: Places a white line segment connecting (72, 52) to (217, 142).
; PLAN: r0=72(x1), r1=52(y1), r2=217(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 52
LDI r2, 217
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
