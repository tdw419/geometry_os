; DESCRIPTION: Composite: Places a black dot at position (0, 18) then Draws a yellow circle centered at (392, 195) with radius 35.
; PLAN: r0=0(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=195(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 18
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 392
LDI r6, 195
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
