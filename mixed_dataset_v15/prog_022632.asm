; DESCRIPTION: Composite: Sets a single cyan pixel at (315, 38) then Draws a yellow circle centered at (402, 149) with radius 64.
; PLAN: r0=315(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=149(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 149
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
