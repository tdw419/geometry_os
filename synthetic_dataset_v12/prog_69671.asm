; DESCRIPTION: Composite: Places a blue dot at position (368, 248) then Draws a yellow circle centered at (273, 118) with radius 62.
; PLAN: r0=368(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=118(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 118
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
