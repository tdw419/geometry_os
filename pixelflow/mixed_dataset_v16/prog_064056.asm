; DESCRIPTION: Composite: Sets a single blue pixel at (230, 219) then Renders a cyan disk with center (129, 86) and radius 46.
; PLAN: r0=230(x), r1=219(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=86(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 219
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 86
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
