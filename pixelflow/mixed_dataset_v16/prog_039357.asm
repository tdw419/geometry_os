; DESCRIPTION: Composite: Places a purple dot at position (324, 254) then Draws a blue circle centered at (440, 137) with radius 67.
; PLAN: r0=324(x), r1=254(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=137(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 254
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 137
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
