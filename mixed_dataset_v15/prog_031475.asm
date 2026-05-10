; DESCRIPTION: Composite: Draws a purple rectangle at (217, 33) with width 47 and height 98 then Places a orange circle of radius 19 at center (233, 39).
; PLAN: r0=217(x), r1=33(y), r2=47(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=39(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 217
LDI r1, 33
LDI r2, 47
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 39
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
