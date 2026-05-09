; DESCRIPTION: Composite: Draws a black circle centered at (404, 167) with radius 63 then Places a purple dot at position (234, 223).
; PLAN: r0=404(x), r1=167(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 167
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
