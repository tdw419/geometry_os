; DESCRIPTION: Composite: Sets a single green pixel at (181, 74) then Draws a white circle centered at (409, 132) with radius 46.
; PLAN: r0=181(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=132(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 132
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
