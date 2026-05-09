; DESCRIPTION: Places a orange line segment connecting (197, 91) to (245, 189).
; PLAN: r0=197(x1), r1=91(y1), r2=245(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 91
LDI r2, 245
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
