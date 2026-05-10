; DESCRIPTION: Composite: Places a purple dot at position (403, 42) then Draws a magenta circle centered at (378, 21) with radius 14.
; PLAN: r0=403(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=21(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 21
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
