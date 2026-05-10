; DESCRIPTION: Composite: Places a black dot at position (193, 144) then Draws a blue circle centered at (429, 85) with radius 23.
; PLAN: r0=193(x), r1=144(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=85(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 144
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 85
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
