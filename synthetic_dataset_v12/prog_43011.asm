; DESCRIPTION: Composite: Draws a green circle centered at (387, 144) with radius 34 then Places a purple dot at position (87, 83).
; PLAN: r0=387(x), r1=144(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 144
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
