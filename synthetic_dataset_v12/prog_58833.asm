; DESCRIPTION: Composite: Places a blue dot at position (425, 225) then Places a magenta circle of radius 13 at center (493, 34).
; PLAN: r0=425(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=493(x), r6=34(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 34
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
