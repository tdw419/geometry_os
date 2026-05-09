; DESCRIPTION: Composite: Places a blue circle of radius 44 at center (110, 99) then Places a blue dot at position (298, 236).
; PLAN: r0=110(x), r1=99(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=236(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 99
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 236
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
