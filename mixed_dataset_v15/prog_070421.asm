; DESCRIPTION: Composite: Renders a orange box of size 23x40 starting at (233, 126) then Draws a red circle centered at (328, 106) with radius 15.
; PLAN: r0=233(x), r1=126(y), r2=23(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=106(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 126
LDI r2, 23
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 106
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
