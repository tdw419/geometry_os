; DESCRIPTION: Composite: Places a orange dot at position (247, 230) then Renders a white disk with center (28, 182) and radius 25.
; PLAN: r0=247(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=28(x), r6=182(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 28
LDI r6, 182
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
