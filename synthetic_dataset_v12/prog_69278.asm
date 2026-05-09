; DESCRIPTION: Composite: Creates a red circular shape at (419, 112) with radius 25 then Draws a purple rectangle at (97, 154) with width 99 and height 84.
; PLAN: r0=419(x), r1=112(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=154(y), r7=99(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 112
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 154
LDI r7, 99
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
