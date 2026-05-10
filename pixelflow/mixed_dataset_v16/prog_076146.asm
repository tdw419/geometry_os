; DESCRIPTION: Composite: Places a white dot at position (75, 125) then Renders a blue disk with center (194, 212) and radius 29.
; PLAN: r0=75(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=212(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 212
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
