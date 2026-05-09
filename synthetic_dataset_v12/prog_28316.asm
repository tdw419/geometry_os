; DESCRIPTION: Composite: Draws a blue circle centered at (310, 37) with radius 33 then Places a white dot at position (214, 125).
; PLAN: r0=310(x), r1=37(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=125(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 37
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 125
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
