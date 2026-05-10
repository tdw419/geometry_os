; DESCRIPTION: Composite: Places a orange dot at position (375, 128) then Places a magenta circle of radius 72 at center (199, 158).
; PLAN: r0=375(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=158(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 199
LDI r6, 158
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
