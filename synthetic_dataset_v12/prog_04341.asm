; DESCRIPTION: Composite: Places a red dot at position (134, 39) then Draws a black circle centered at (387, 176) with radius 65.
; PLAN: r0=134(x), r1=39(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=176(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 39
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 387
LDI r6, 176
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
