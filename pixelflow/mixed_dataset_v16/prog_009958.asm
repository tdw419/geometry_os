; DESCRIPTION: Composite: Draws a green circle centered at (301, 202) with radius 29 then Places a purple dot at position (439, 226).
; PLAN: r0=301(x), r1=202(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=226(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 202
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 226
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
