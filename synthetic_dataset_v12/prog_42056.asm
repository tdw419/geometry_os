; DESCRIPTION: Composite: Draws a black circle centered at (172, 161) with radius 49 then Creates a yellow rectangular region at (292, 140) spanning 77 by 51 pixels.
; PLAN: r0=172(x), r1=161(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=140(y), r7=77(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 161
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 140
LDI r7, 77
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
