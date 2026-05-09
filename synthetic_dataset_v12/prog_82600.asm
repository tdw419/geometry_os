; DESCRIPTION: Composite: Renders a red disk with center (132, 173) and radius 27 then Draws a magenta rectangle at (271, 141) with width 30 and height 106 then Sets a single green pixel at (76, 172).
; PLAN: r0=132(x), r1=173(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=141(y), r7=30(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=172(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 173
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 141
LDI r7, 30
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 172
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
