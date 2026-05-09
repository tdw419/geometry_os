; DESCRIPTION: Composite: Places a green dot at position (223, 37) then Draws a red circle centered at (309, 121) with radius 48.
; PLAN: r0=223(x), r1=37(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=121(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 223
LDI r1, 37
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 309
LDI r6, 121
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
