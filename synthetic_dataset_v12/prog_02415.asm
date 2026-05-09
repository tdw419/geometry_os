; DESCRIPTION: Composite: Places a yellow dot at position (27, 46) then Draws a white circle centered at (219, 53) with radius 26.
; PLAN: r0=27(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=53(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 53
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
