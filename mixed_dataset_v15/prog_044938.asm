; DESCRIPTION: Places a orange line segment connecting (25, 197) to (124, 91).
; PLAN: r0=25(x1), r1=197(y1), r2=124(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 197
LDI r2, 124
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
