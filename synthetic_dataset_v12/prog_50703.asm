; DESCRIPTION: Composite: Places a yellow dot at position (42, 12) then Draws a yellow circle centered at (292, 177) with radius 79.
; PLAN: r0=42(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=177(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 292
LDI r6, 177
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
