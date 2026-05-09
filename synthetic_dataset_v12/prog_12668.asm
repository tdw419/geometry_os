; DESCRIPTION: Composite: Places a yellow dot at position (19, 19) then Renders a yellow disk with center (60, 155) and radius 57.
; PLAN: r0=19(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=155(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 155
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
