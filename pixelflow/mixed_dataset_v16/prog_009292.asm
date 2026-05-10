; DESCRIPTION: Composite: Places a green dot at position (493, 65) then Places a black circle of radius 37 at center (83, 59).
; PLAN: r0=493(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=59(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 65
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 83
LDI r6, 59
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
