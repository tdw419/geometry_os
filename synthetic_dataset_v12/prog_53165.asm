; DESCRIPTION: Composite: Sets a single green pixel at (61, 62) then Places a magenta circle of radius 63 at center (385, 137).
; PLAN: r0=61(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=137(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 385
LDI r6, 137
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
