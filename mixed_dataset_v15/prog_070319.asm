; DESCRIPTION: Composite: Places a black dot at position (274, 17) then Draws a white circle centered at (108, 148) with radius 68.
; PLAN: r0=274(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=148(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 108
LDI r6, 148
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
