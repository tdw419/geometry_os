; DESCRIPTION: Composite: Sets a single orange pixel at (89, 131) then Draws a blue circle centered at (146, 158) with radius 65 then Renders a green box of size 65x47 starting at (144, 167).
; PLAN: r0=89(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=158(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x), r11=167(y), r12=65(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 146
LDI r6, 158
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 167
LDI r12, 65
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
