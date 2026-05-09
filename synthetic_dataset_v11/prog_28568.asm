; DESCRIPTION: Composite: . Then Places a orange line segment connecting (12, 119) to (25, 86). Then Places a green dot at position (232, 88).
; PLAN: r0=12(x1), r1=119(y1), r2=25(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=232(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (12, 119) to (25, 86).
; PLAN: r0=12(x1), r1=119(y1), r2=25(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 119
LDI r2, 25
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (232, 88).
; PLAN: r0=232(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
