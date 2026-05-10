; DESCRIPTION: Composite: Places a yellow dot at position (185, 1) then Draws a yellow circle centered at (171, 203) with radius 29.
; PLAN: r0=185(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=203(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 171
LDI r6, 203
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
