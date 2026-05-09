; DESCRIPTION: Composite: Sets a single cyan pixel at (25, 46) then Places a blue circle of radius 29 at center (98, 137).
; PLAN: r0=25(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=137(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 137
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
