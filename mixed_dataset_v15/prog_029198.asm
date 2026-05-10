; DESCRIPTION: Composite: Places a orange line segment connecting (159, 34) to (170, 8) then Places a green dot at position (238, 229).
; PLAN: r0=159(x1), r1=34(y1), r2=170(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=229(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 34
LDI r2, 170
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 229
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
