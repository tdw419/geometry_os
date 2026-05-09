; DESCRIPTION: Composite: Draws a green circle centered at (85, 189) with radius 16 then Sets a single magenta pixel at (292, 36).
; PLAN: r0=85(x), r1=189(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=36(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 189
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 36
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
