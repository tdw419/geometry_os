; DESCRIPTION: Composite: Draws a white circle centered at (83, 173) with radius 70 then Sets a single red pixel at (213, 39).
; PLAN: r0=83(x), r1=173(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 173
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
