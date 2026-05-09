; DESCRIPTION: Composite: Renders a black disk with center (143, 128) and radius 50 then Places a red dot at position (505, 220) then Creates a blue rectangular region at (9, 127) spanning 69 by 73 pixels.
; PLAN: r0=143(x), r1=128(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=220(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=127(y), r12=69(width), r13=73(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 128
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 220
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 9
LDI r11, 127
LDI r12, 69
LDI r13, 73
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
