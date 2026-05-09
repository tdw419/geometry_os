; DESCRIPTION: Composite: Creates a black circular shape at (288, 102) with radius 59 then Places a black dot at position (175, 74).
; PLAN: r0=288(x), r1=102(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=74(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 102
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 74
LDI r7, 0x000000
PSET r5, r6, r7
HALT
