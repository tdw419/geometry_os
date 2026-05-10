; DESCRIPTION: Composite: Draws a white rectangle at (450, 181) with width 35 and height 50 then Places a yellow circle of radius 47 at center (363, 110).
; PLAN: r0=450(x), r1=181(y), r2=35(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=110(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 450
LDI r1, 181
LDI r2, 35
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 110
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
