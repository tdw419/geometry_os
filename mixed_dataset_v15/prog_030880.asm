; DESCRIPTION: Composite: Sets a single purple pixel at (443, 25) then Places a magenta circle of radius 42 at center (204, 94).
; PLAN: r0=443(x), r1=25(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=94(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 94
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
