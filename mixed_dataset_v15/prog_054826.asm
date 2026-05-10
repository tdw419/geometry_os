; DESCRIPTION: Composite: Draws a purple circle centered at (163, 122) with radius 12 then Places a yellow 50x11 rectangle at position (37, 164) then Places a blue dot at position (489, 146).
; PLAN: r0=163(x), r1=122(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=164(y), r7=50(width), r8=11(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x), r11=146(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 122
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 164
LDI r7, 50
LDI r8, 11
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 146
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
