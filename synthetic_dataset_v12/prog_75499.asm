; DESCRIPTION: Renders a orange line between points (251, 109) and (285, 207).
; PLAN: r0=251(x1), r1=109(y1), r2=285(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 109
LDI r2, 285
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
