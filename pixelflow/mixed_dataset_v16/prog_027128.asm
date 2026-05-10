; DESCRIPTION: Renders a orange line between points (466, 103) and (441, 207).
; PLAN: r0=466(x1), r1=103(y1), r2=441(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 103
LDI r2, 441
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
