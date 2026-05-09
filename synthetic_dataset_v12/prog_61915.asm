; DESCRIPTION: Composite: Places a green circle of radius 65 at center (280, 98) then Sets a single cyan pixel at (158, 175).
; PLAN: r0=280(x), r1=98(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=175(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 98
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 175
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
