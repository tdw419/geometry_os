; DESCRIPTION: Composite: Sets a single cyan pixel at (110, 43) then Renders a magenta disk with center (407, 164) and radius 63.
; PLAN: r0=110(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=164(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 164
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
