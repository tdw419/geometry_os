; DESCRIPTION: Renders a orange line between points (49, 128) and (91, 170).
; PLAN: r0=49(x1), r1=128(y1), r2=91(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 128
LDI r2, 91
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
