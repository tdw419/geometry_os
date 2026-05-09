; DESCRIPTION: Composite: Places a cyan circle of radius 67 at center (219, 104) then Places a blue dot at position (44, 191).
; PLAN: r0=219(x), r1=104(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=191(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 219
LDI r1, 104
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 191
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
