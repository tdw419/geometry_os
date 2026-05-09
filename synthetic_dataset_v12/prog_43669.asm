; DESCRIPTION: Places a white line segment connecting (354, 252) to (217, 71).
; PLAN: r0=354(x1), r1=252(y1), r2=217(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 252
LDI r2, 217
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
