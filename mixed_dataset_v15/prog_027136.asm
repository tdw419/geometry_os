; DESCRIPTION: Composite: Places a magenta dot at position (266, 240) then Places a magenta circle of radius 11 at center (350, 216).
; PLAN: r0=266(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=216(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 216
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
