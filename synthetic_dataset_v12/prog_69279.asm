; DESCRIPTION: Composite: Places a orange dot at position (182, 237) then Places a magenta circle of radius 30 at center (110, 118).
; PLAN: r0=182(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=118(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 110
LDI r6, 118
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
