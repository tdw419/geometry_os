; DESCRIPTION: Composite: Sets a single magenta pixel at (320, 195) then Places a purple circle of radius 32 at center (181, 141).
; PLAN: r0=320(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=141(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 141
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
