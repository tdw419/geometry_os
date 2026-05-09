; DESCRIPTION: Places a red line segment connecting (217, 87) to (33, 119).
; PLAN: r0=217(x1), r1=87(y1), r2=33(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 87
LDI r2, 33
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
