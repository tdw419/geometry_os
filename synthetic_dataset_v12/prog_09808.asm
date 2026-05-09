; DESCRIPTION: Composite: Places a green dot at position (335, 76) then Draws a blue circle centered at (278, 208) with radius 48.
; PLAN: r0=335(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=208(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 208
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
