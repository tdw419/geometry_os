; DESCRIPTION: Composite: Draws a orange rectangle at (259, 74) with width 85 and height 75 then Creates a red circular shape at (201, 201) with radius 34.
; PLAN: r0=259(x), r1=74(y), r2=85(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=201(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 74
LDI r2, 85
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 201
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
