; DESCRIPTION: Composite: Places a blue circle of radius 49 at center (370, 59) then Places a purple dot at position (36, 13).
; PLAN: r0=370(x), r1=59(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=13(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 59
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 13
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
