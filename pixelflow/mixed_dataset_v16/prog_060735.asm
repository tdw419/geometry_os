; DESCRIPTION: Composite: Places a yellow line segment connecting (482, 18) to (491, 151) then Sets a single green pixel at (323, 220).
; PLAN: r0=482(x1), r1=18(y1), r2=491(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 18
LDI r2, 491
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
