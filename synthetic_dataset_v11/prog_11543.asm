; DESCRIPTION: Places a white line segment connecting (217, 122) to (79, 81).
; PLAN: r0=217(x1), r1=122(y1), r2=79(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 122
LDI r2, 79
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
