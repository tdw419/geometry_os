; DESCRIPTION: Composite: Places a black line segment connecting (233, 10) to (391, 213) then Draws a blue rectangle at (208, 67) with width 105 and height 38 then Draws a yellow circle centered at (426, 98) with radius 79.
; PLAN: r0=233(x1), r1=10(y1), r2=391(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=67(y), r7=105(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=98(y), r12=79(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 10
LDI r2, 391
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 67
LDI r7, 105
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 98
LDI r12, 79
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
