; DESCRIPTION: Composite: Sets a single black pixel at (386, 163) then Places a blue circle of radius 59 at center (312, 171).
; PLAN: r0=386(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=171(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 312
LDI r6, 171
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
