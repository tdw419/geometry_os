; DESCRIPTION: Composite: Places a red dot at position (220, 54) then Draws a white circle centered at (94, 199) with radius 48.
; PLAN: r0=220(x), r1=54(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=199(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 54
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 199
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
