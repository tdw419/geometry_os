; DESCRIPTION: Composite: Places a white dot at position (489, 242) then Renders a cyan disk with center (376, 136) and radius 78.
; PLAN: r0=489(x), r1=242(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=136(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 242
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 136
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
