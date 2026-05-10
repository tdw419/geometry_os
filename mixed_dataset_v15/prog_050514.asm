; DESCRIPTION: Composite: Places a blue dot at position (368, 30) then Draws a green circle centered at (296, 86) with radius 61.
; PLAN: r0=368(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=86(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 86
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
