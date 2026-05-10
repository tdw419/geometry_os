; DESCRIPTION: Composite: Renders a orange disk with center (202, 99) and radius 68 then Draws a purple rectangle at (83, 200) with width 57 and height 18.
; PLAN: r0=202(x), r1=99(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=200(y), r7=57(width), r8=18(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 99
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 200
LDI r7, 57
LDI r8, 18
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
