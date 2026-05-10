; DESCRIPTION: Composite: Places a blue 77x73 rectangle at position (238, 144) then Places a green dot at position (162, 84) then Creates a purple circular shape at (219, 55) with radius 12.
; PLAN: r0=238(x), r1=144(y), r2=77(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=84(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=55(y), r12=12(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 144
LDI r2, 77
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 84
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 219
LDI r11, 55
LDI r12, 12
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
