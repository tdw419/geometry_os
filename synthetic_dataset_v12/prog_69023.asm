; DESCRIPTION: Composite: Places a yellow dot at position (9, 196) then Creates a blue circular shape at (210, 170) with radius 14.
; PLAN: r0=9(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=170(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 170
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
