; DESCRIPTION: Composite: Places a orange line segment connecting (130, 92) to (220, 3) then Places a blue dot at position (440, 199).
; PLAN: r0=130(x1), r1=92(y1), r2=220(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=199(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 92
LDI r2, 220
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 199
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
