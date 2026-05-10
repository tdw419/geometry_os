; DESCRIPTION: Composite: Renders a orange line between points (319, 170) and (27, 99) then Places a white dot at position (482, 194).
; PLAN: r0=319(x1), r1=170(y1), r2=27(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 170
LDI r2, 27
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
