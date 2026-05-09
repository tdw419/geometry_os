; DESCRIPTION: Composite: Places a orange dot at position (188, 30) then Draws a blue circle centered at (142, 96) with radius 46.
; PLAN: r0=188(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=96(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 142
LDI r6, 96
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
