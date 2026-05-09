; DESCRIPTION: Composite: Places a red dot at position (235, 129) then Renders a cyan disk with center (325, 143) and radius 77.
; PLAN: r0=235(x), r1=129(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=143(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 129
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 325
LDI r6, 143
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
