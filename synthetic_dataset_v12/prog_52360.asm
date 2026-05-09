; DESCRIPTION: Composite: Sets a single cyan pixel at (488, 80) then Renders a magenta disk with center (132, 170) and radius 62.
; PLAN: r0=488(x), r1=80(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=170(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 488
LDI r1, 80
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 170
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
