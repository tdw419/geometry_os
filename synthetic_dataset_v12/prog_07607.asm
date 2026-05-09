; DESCRIPTION: Composite: Draws a yellow rectangle at (292, 177) with width 26 and height 65 then Creates a red circular shape at (347, 83) with radius 54.
; PLAN: r0=292(x), r1=177(y), r2=26(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=83(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 177
LDI r2, 26
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 83
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
