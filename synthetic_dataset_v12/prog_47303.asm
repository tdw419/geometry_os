; DESCRIPTION: Composite: Draws a white circle centered at (93, 145) with radius 72 then Creates a yellow rectangular region at (120, 213) spanning 45 by 15 pixels.
; PLAN: r0=93(x), r1=145(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=213(y), r7=45(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 145
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 213
LDI r7, 45
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
