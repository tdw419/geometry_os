; DESCRIPTION: Composite: Places a white dot at position (125, 59) then Draws a white circle centered at (289, 111) with radius 29.
; PLAN: r0=125(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=111(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 111
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
