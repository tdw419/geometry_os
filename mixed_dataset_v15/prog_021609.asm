; DESCRIPTION: Composite: Renders a yellow box of size 111x96 starting at (248, 56) then Sets a single magenta pixel at (452, 165).
; PLAN: r0=248(x), r1=56(y), r2=111(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=165(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 56
LDI r2, 111
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 165
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
