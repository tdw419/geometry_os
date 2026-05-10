; DESCRIPTION: Composite: Renders a red box of size 20x103 starting at (292, 98) then Places a black dot at position (391, 158) then Creates a magenta circular shape at (366, 120) with radius 43.
; PLAN: r0=292(x), r1=98(y), r2=20(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=158(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=120(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 98
LDI r2, 20
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 158
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 366
LDI r11, 120
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
