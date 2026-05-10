; DESCRIPTION: Places a orange line segment connecting (445, 199) to (91, 124).
; PLAN: r0=445(x1), r1=199(y1), r2=91(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 199
LDI r2, 91
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
