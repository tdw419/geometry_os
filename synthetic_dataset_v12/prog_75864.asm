; DESCRIPTION: Composite: Sets a single black pixel at (356, 93) then Draws a magenta circle centered at (21, 90) with radius 13.
; PLAN: r0=356(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=90(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 93
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 21
LDI r6, 90
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
