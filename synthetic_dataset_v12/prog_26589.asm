; DESCRIPTION: Composite: Renders a purple disk with center (270, 104) and radius 48 then Sets a single cyan pixel at (260, 136).
; PLAN: r0=270(x), r1=104(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=136(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 104
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 136
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
