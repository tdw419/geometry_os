; DESCRIPTION: Composite: Sets a single yellow pixel at (164, 98) then Renders a white box of size 95x44 starting at (158, 123) then Draws a magenta circle centered at (421, 146) with radius 70.
; PLAN: r0=164(x), r1=98(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=158(x), r6=123(y), r7=95(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=146(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 98
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 158
LDI r6, 123
LDI r7, 95
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 146
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
