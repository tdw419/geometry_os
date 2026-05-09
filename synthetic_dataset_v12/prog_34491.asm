; DESCRIPTION: Renders a orange line between points (251, 190) and (275, 241).
; PLAN: r0=251(x1), r1=190(y1), r2=275(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 190
LDI r2, 275
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
