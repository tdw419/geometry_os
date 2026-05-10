; DESCRIPTION: Composite: Creates a yellow rectangular region at (69, 62) spanning 80 by 96 pixels then Places a green dot at position (229, 198) then Creates a blue circular shape at (108, 215) with radius 10.
; PLAN: r0=69(x), r1=62(y), r2=80(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=198(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=215(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 62
LDI r2, 80
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 198
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 108
LDI r11, 215
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
