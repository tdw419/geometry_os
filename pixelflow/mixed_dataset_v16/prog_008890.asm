; DESCRIPTION: Composite: Places a white dot at position (404, 165) then Renders a green disk with center (407, 78) and radius 72.
; PLAN: r0=404(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=78(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 78
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
