; DESCRIPTION: Composite: Places a orange dot at position (75, 40) then Draws a white circle centered at (81, 90) with radius 34.
; PLAN: r0=75(x), r1=40(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=90(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 40
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 81
LDI r6, 90
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
