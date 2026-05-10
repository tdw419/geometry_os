; DESCRIPTION: Composite: Places a blue dot at position (280, 178) then Draws a red circle centered at (255, 172) with radius 57.
; PLAN: r0=280(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=172(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 172
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
