; DESCRIPTION: Composite: . Then Places a orange line segment connecting (10, 36) to (132, 122). Then Places a green dot at position (250, 25).
; PLAN: r0=10(x1), r1=36(y1), r2=132(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=250(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (10, 36) to (132, 122).
; PLAN: r0=10(x1), r1=36(y1), r2=132(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 36
LDI r2, 132
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (250, 25).
; PLAN: r0=250(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
