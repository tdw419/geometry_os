; DESCRIPTION: Composite: Creates a yellow circular shape at (305, 136) with radius 52 then Places a blue dot at position (463, 179).
; PLAN: r0=305(x), r1=136(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 136
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
