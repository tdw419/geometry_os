; DESCRIPTION: Composite: Draws a orange rectangle at (134, 90) with width 75 and height 55 then Places a cyan circle of radius 52 at center (226, 77).
; PLAN: r0=134(x), r1=90(y), r2=75(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=77(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 90
LDI r2, 75
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 77
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
