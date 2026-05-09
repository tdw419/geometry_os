; DESCRIPTION: Composite: . Then Places a orange line segment connecting (211, 98) to (56, 136). Then Places a green dot at position (216, 75).
; PLAN: r0=211(x1), r1=98(y1), r2=56(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=216(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (211, 98) to (56, 136).
; PLAN: r0=211(x1), r1=98(y1), r2=56(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 98
LDI r2, 56
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (216, 75).
; PLAN: r0=216(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
