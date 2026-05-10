; DESCRIPTION: Composite: Sets a single cyan pixel at (247, 46) then Draws a yellow circle centered at (415, 104) with radius 22.
; PLAN: r0=247(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=104(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 104
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
