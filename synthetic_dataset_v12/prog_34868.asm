; DESCRIPTION: Composite: Renders a cyan line between points (257, 60) and (477, 75) then Draws a orange circle centered at (315, 81) with radius 44.
; PLAN: r0=257(x1), r1=60(y1), r2=477(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=81(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 60
LDI r2, 477
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 81
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
