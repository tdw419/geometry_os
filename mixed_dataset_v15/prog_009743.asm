; DESCRIPTION: Composite: Places a black dot at position (256, 129) then Renders a green disk with center (174, 174) and radius 77.
; PLAN: r0=256(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=174(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 174
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
