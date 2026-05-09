; DESCRIPTION: Composite: Renders a red box of size 108x110 starting at (147, 15) then Places a green circle of radius 75 at center (158, 108).
; PLAN: r0=147(x), r1=15(y), r2=108(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=108(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 15
LDI r2, 108
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 108
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
