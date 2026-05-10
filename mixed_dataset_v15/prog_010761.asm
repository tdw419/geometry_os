; DESCRIPTION: Composite: Places a orange dot at position (220, 65) then Draws a red circle centered at (310, 125) with radius 72.
; PLAN: r0=220(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=125(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 310
LDI r6, 125
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
