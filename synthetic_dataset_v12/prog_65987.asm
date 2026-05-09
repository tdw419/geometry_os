; DESCRIPTION: Renders a orange line between points (467, 140) and (251, 1).
; PLAN: r0=467(x1), r1=140(y1), r2=251(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 140
LDI r2, 251
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
