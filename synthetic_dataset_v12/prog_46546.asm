; DESCRIPTION: Renders a orange line between points (405, 10) and (437, 91).
; PLAN: r0=405(x1), r1=10(y1), r2=437(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 10
LDI r2, 437
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
