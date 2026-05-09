; DESCRIPTION: Composite: Draws a magenta circle centered at (228, 161) with radius 53 then Places a blue dot at position (189, 61).
; PLAN: r0=228(x), r1=161(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=61(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 161
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 61
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
