; DESCRIPTION: Composite: Places a white dot at position (94, 121) then Draws a green circle centered at (125, 208) with radius 15.
; PLAN: r0=94(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=208(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 208
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
