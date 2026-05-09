; DESCRIPTION: Composite: Places a purple line segment connecting (492, 225) to (475, 27) then Places a purple dot at position (333, 119).
; PLAN: r0=492(x1), r1=225(y1), r2=475(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 225
LDI r2, 475
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
