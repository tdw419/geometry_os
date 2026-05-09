; DESCRIPTION: Composite: Sets a single white pixel at (298, 144) then Places a blue circle of radius 31 at center (254, 221).
; PLAN: r0=298(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=221(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 221
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
