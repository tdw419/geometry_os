; DESCRIPTION: Composite: Sets a single cyan pixel at (288, 20) then Draws a purple circle centered at (278, 109) with radius 74.
; PLAN: r0=288(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=109(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 109
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
