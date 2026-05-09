; DESCRIPTION: Composite: Places a white line segment connecting (53, 188) to (420, 55) then Sets a single blue pixel at (496, 5).
; PLAN: r0=53(x1), r1=188(y1), r2=420(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 188
LDI r2, 420
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
