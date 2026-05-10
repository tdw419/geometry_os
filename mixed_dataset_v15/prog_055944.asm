; DESCRIPTION: Composite: Places a green dot at position (405, 57) then Draws a white circle centered at (247, 119) with radius 55.
; PLAN: r0=405(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=119(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 119
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
