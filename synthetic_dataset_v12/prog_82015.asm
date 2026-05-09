; DESCRIPTION: Composite: Places a blue dot at position (343, 225) then Draws a red circle centered at (406, 214) with radius 13.
; PLAN: r0=343(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=214(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 214
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
