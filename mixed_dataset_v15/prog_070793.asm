; DESCRIPTION: Composite: Creates a purple circular shape at (366, 115) with radius 46 then Draws a white rectangle at (31, 176) with width 93 and height 65.
; PLAN: r0=366(x), r1=115(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=176(y), r7=93(width), r8=65(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 115
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 176
LDI r7, 93
LDI r8, 65
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
