; DESCRIPTION: Composite: Places a green circle of radius 30 at center (218, 88) then Places a black dot at position (409, 110).
; PLAN: r0=218(x), r1=88(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=110(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 88
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 110
LDI r7, 0x000000
PSET r5, r6, r7
HALT
