; DESCRIPTION: Composite: Sets a single cyan pixel at (385, 115) then Draws a magenta circle centered at (223, 145) with radius 63.
; PLAN: r0=385(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=145(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 385
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 145
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
