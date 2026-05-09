; DESCRIPTION: Composite: Sets a single magenta pixel at (239, 63) then Creates a cyan circular shape at (86, 155) with radius 74.
; PLAN: r0=239(x), r1=63(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=155(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 63
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 155
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
