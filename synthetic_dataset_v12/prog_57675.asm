; DESCRIPTION: Renders a orange line between points (98, 245) and (445, 114).
; PLAN: r0=98(x1), r1=245(y1), r2=445(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 245
LDI r2, 445
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
