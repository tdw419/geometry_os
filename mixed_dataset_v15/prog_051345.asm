; DESCRIPTION: Composite: Sets a single yellow pixel at (362, 133) then Draws a green circle centered at (330, 156) with radius 52.
; PLAN: r0=362(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=156(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 362
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 330
LDI r6, 156
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
