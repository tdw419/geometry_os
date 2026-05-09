; DESCRIPTION: Composite: Places a yellow dot at position (193, 70) then Draws a blue circle centered at (358, 76) with radius 50.
; PLAN: r0=193(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=76(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 358
LDI r6, 76
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
