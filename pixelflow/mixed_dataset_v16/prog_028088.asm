; DESCRIPTION: Composite: Sets a single blue pixel at (102, 244) then Renders a cyan disk with center (171, 59) and radius 34.
; PLAN: r0=102(x), r1=244(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=59(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 244
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 59
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
