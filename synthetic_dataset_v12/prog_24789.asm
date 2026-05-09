; DESCRIPTION: Composite: Renders a cyan box of size 20x35 starting at (128, 147) then Sets a single yellow pixel at (282, 128) then Draws a green circle centered at (106, 177) with radius 65.
; PLAN: r0=128(x), r1=147(y), r2=20(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=128(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=177(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 147
LDI r2, 20
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 128
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 106
LDI r11, 177
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
