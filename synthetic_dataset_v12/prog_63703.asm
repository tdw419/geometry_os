; DESCRIPTION: Composite: Places a magenta dot at position (27, 183) then Renders a magenta disk with center (266, 109) and radius 74.
; PLAN: r0=27(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=109(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 109
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
