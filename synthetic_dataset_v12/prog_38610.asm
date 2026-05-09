; DESCRIPTION: Composite: Draws a blue circle centered at (284, 178) with radius 62 then Places a orange dot at position (73, 32).
; PLAN: r0=284(x), r1=178(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 178
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
