; DESCRIPTION: Composite: Renders a green disk with center (185, 122) and radius 38 then Sets a single cyan pixel at (440, 1).
; PLAN: r0=185(x), r1=122(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=1(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 122
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 1
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
