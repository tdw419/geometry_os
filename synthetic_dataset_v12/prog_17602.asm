; DESCRIPTION: Composite: Creates a purple circular shape at (191, 197) with radius 57 then Places a magenta dot at position (172, 49).
; PLAN: r0=191(x), r1=197(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=49(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 197
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 49
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
