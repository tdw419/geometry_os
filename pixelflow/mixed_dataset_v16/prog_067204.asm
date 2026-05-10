; DESCRIPTION: Composite: Places a red dot at position (94, 0) then Draws a white circle centered at (371, 115) with radius 49.
; PLAN: r0=94(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=115(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 371
LDI r6, 115
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
