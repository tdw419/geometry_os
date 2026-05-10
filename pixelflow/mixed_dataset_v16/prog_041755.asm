; DESCRIPTION: Composite: Draws a yellow circle centered at (405, 210) with radius 13 then Draws a red rectangle at (253, 101) with width 36 and height 65.
; PLAN: r0=405(x), r1=210(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=101(y), r7=36(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 210
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 101
LDI r7, 36
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
