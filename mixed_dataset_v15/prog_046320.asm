; DESCRIPTION: Composite: Places a magenta dot at position (223, 219) then Renders a red disk with center (339, 155) and radius 30.
; PLAN: r0=223(x), r1=219(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=155(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 223
LDI r1, 219
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 155
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
