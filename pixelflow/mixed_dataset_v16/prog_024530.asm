; DESCRIPTION: Composite: Draws a magenta rectangle at (175, 127) with width 46 and height 47 then Places a cyan dot at position (143, 80) then Renders a purple disk with center (55, 109) and radius 29.
; PLAN: r0=175(x), r1=127(y), r2=46(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=80(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=55(x), r11=109(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 127
LDI r2, 46
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 80
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 109
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
