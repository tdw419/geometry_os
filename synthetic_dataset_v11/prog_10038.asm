; DESCRIPTION: Places a red line segment connecting (71, 145) to (175, 64).
; PLAN: r0=71(x1), r1=145(y1), r2=175(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 175
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
