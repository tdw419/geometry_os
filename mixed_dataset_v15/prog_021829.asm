; DESCRIPTION: Composite: Renders a green disk with center (293, 79) and radius 77 then Draws a purple rectangle at (50, 13) with width 38 and height 74.
; PLAN: r0=293(x), r1=79(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=13(y), r7=38(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 79
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 13
LDI r7, 38
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
