; DESCRIPTION: Composite: Renders a black line between points (69, 170) and (484, 54) then Places a cyan dot at position (36, 248).
; PLAN: r0=69(x1), r1=170(y1), r2=484(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=248(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 170
LDI r2, 484
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 248
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
