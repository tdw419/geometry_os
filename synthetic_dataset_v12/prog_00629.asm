; DESCRIPTION: Places a black line segment connecting (57, 247) to (217, 140).
; PLAN: r0=57(x1), r1=247(y1), r2=217(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 247
LDI r2, 217
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
