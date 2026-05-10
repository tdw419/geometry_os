; DESCRIPTION: Composite: Sets a single cyan pixel at (11, 4) then Renders a yellow disk with center (359, 185) and radius 64.
; PLAN: r0=11(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=185(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 185
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
