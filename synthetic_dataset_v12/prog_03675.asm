; DESCRIPTION: Composite: Draws a blue circle centered at (103, 162) with radius 13 then Sets a single black pixel at (209, 83).
; PLAN: r0=103(x), r1=162(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=83(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 162
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 83
LDI r7, 0x000000
PSET r5, r6, r7
HALT
