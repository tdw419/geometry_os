; DESCRIPTION: Composite: Places a blue dot at position (12, 32) then Creates a yellow circular shape at (32, 194) with radius 25.
; PLAN: r0=12(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=194(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 32
LDI r6, 194
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
