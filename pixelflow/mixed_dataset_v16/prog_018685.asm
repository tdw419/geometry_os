; DESCRIPTION: Composite: Creates a black circular shape at (316, 186) with radius 70 then Draws a magenta rectangle at (487, 12) with width 18 and height 51.
; PLAN: r0=316(x), r1=186(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=12(y), r7=18(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 186
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 12
LDI r7, 18
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
