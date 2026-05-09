; DESCRIPTION: Composite: Renders a blue box of size 75x16 starting at (105, 117) then Draws a yellow circle centered at (185, 164) with radius 52 then Sets a single yellow pixel at (4, 56).
; PLAN: r0=105(x), r1=117(y), r2=75(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=164(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=56(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 117
LDI r2, 75
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 164
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 56
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
