; DESCRIPTION: Composite: Creates a black circular shape at (185, 202) with radius 50 then Places a blue dot at position (57, 146).
; PLAN: r0=185(x), r1=202(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=146(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 202
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 146
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
