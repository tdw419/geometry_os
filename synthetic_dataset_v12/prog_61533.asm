; DESCRIPTION: Composite: Draws a purple circle centered at (313, 97) with radius 40 then Places a red dot at position (269, 99).
; PLAN: r0=313(x), r1=97(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=99(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 97
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 99
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
