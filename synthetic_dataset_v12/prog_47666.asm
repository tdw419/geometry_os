; DESCRIPTION: Composite: Draws a yellow circle centered at (372, 93) with radius 70 then Places a purple dot at position (124, 144).
; PLAN: r0=372(x), r1=93(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=144(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 93
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 144
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
