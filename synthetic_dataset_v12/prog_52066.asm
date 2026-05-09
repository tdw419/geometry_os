; DESCRIPTION: Composite: Places a cyan dot at position (429, 123) then Renders a magenta disk with center (298, 44) and radius 17.
; PLAN: r0=429(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=44(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 44
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
