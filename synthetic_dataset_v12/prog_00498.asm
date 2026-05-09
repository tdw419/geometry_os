; DESCRIPTION: Composite: Places a black dot at position (476, 224) then Draws a yellow circle centered at (345, 56) with radius 25.
; PLAN: r0=476(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=56(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 345
LDI r6, 56
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
