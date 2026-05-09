; DESCRIPTION: Composite: Places a red dot at position (37, 44) then Renders a white disk with center (394, 158) and radius 78.
; PLAN: r0=37(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=158(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 394
LDI r6, 158
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
