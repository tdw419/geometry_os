; DESCRIPTION: Composite: Sets a single cyan pixel at (54, 87) then Draws a orange circle centered at (341, 152) with radius 67.
; PLAN: r0=54(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=152(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 152
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
