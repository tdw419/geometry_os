; DESCRIPTION: Composite: Creates a yellow circular shape at (175, 184) with radius 40 then Creates a white rectangular region at (362, 81) spanning 13 by 115 pixels.
; PLAN: r0=175(x), r1=184(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=81(y), r7=13(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 184
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 81
LDI r7, 13
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
