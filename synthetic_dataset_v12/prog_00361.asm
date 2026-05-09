; DESCRIPTION: Composite: Renders a yellow line between points (391, 205) and (195, 120) then Draws a blue rectangle at (219, 75) with width 100 and height 22 then Draws a yellow circle centered at (213, 153) with radius 65.
; PLAN: r0=391(x1), r1=205(y1), r2=195(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=75(y), r7=100(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=153(y), r12=65(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 205
LDI r2, 195
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 75
LDI r7, 100
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 153
LDI r12, 65
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
