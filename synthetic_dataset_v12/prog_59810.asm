; DESCRIPTION: Composite: Places a black dot at position (377, 38) then Draws a orange circle centered at (414, 152) with radius 51.
; PLAN: r0=377(x), r1=38(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=152(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 38
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 152
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
