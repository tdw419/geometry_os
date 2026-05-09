; DESCRIPTION: Composite: Draws a yellow circle centered at (241, 158) with radius 42 then Sets a single magenta pixel at (328, 7).
; PLAN: r0=241(x), r1=158(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=7(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 158
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 7
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
