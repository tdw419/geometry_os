; DESCRIPTION: Places a red line segment connecting (156, 223) to (293, 217).
; PLAN: r0=156(x1), r1=223(y1), r2=293(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 223
LDI r2, 293
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
