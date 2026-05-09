; DESCRIPTION: Places a orange line segment connecting (310, 91) to (46, 91).
; PLAN: r0=310(x1), r1=91(y1), r2=46(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 91
LDI r2, 46
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
