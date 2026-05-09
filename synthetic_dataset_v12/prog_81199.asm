; DESCRIPTION: Composite: Sets a single green pixel at (417, 152) then Draws a orange circle centered at (416, 213) with radius 25.
; PLAN: r0=417(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=213(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 416
LDI r6, 213
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
