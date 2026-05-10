; DESCRIPTION: Composite: Places a white dot at position (240, 131) then Draws a purple circle centered at (415, 192) with radius 19.
; PLAN: r0=240(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=192(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 192
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
