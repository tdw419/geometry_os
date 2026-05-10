; DESCRIPTION: Composite: Places a white dot at position (304, 219) then Renders a cyan disk with center (306, 142) and radius 75.
; PLAN: r0=304(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=142(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 142
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
