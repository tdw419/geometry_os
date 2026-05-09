; DESCRIPTION: Composite: Places a green dot at position (391, 187) then Draws a red circle centered at (399, 85) with radius 21.
; PLAN: r0=391(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=85(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 399
LDI r6, 85
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
