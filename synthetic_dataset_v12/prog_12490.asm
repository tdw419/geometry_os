; DESCRIPTION: Composite: Sets a single black pixel at (69, 70) then Draws a cyan circle centered at (419, 56) with radius 56.
; PLAN: r0=69(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=56(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 419
LDI r6, 56
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
