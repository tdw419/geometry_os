; DESCRIPTION: Places a red line segment connecting (234, 77) to (217, 122).
; PLAN: r0=234(x1), r1=77(y1), r2=217(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 77
LDI r2, 217
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
