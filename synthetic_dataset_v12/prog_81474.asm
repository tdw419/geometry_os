; DESCRIPTION: Composite: Places a magenta dot at position (274, 175) then Places a purple circle of radius 24 at center (280, 28).
; PLAN: r0=274(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=28(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 28
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
