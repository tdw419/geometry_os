; DESCRIPTION: Composite: Places a purple dot at position (474, 247) then Draws a yellow circle centered at (411, 143) with radius 43.
; PLAN: r0=474(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=143(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 143
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
