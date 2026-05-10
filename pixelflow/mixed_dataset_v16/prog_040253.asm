; DESCRIPTION: Composite: Places a green circle of radius 20 at center (402, 122) then Places a cyan dot at position (140, 58).
; PLAN: r0=402(x), r1=122(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=58(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 122
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 58
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
