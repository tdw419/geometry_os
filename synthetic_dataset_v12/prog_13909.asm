; DESCRIPTION: Composite: Renders a blue disk with center (358, 108) and radius 18 then Places a green dot at position (50, 25) then Draws a black rectangle at (0, 198) with width 109 and height 35.
; PLAN: r0=358(x), r1=108(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=25(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=0(x), r11=198(y), r12=109(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 108
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 25
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 0
LDI r11, 198
LDI r12, 109
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
