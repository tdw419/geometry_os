; DESCRIPTION: Composite: Sets a single cyan pixel at (301, 239) then Draws a black circle centered at (435, 105) with radius 50.
; PLAN: r0=301(x), r1=239(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=105(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 239
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 105
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
