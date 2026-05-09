; DESCRIPTION: Composite: Draws a yellow circle centered at (346, 164) with radius 51 then Renders a blue box of size 16x94 starting at (451, 74) then Places a purple dot at position (4, 101).
; PLAN: r0=346(x), r1=164(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=74(y), r7=16(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x), r11=101(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 164
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 74
LDI r7, 16
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 101
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
