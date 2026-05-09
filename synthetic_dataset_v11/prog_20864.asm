; DESCRIPTION: Composite: . Then Places a blue dot at position (229, 169). Then Places a orange line segment connecting (191, 129) to (107, 110).
; PLAN: r0=229(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=191(x1), r1=129(y1), r2=107(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (229, 169).
; PLAN: r0=229(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (191, 129) to (107, 110).
; PLAN: r0=191(x1), r1=129(y1), r2=107(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 129
LDI r2, 107
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
