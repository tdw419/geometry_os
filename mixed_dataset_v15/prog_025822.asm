; DESCRIPTION: Composite: Places a cyan dot at position (459, 66) then Draws a black circle centered at (409, 79) with radius 70.
; PLAN: r0=459(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=79(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 459
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 79
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
