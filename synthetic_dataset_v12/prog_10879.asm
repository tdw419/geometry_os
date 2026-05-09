; DESCRIPTION: Composite: Renders a blue box of size 67x46 starting at (119, 141) then Places a blue dot at position (464, 219) then Draws a purple circle centered at (200, 196) with radius 59.
; PLAN: r0=119(x), r1=141(y), r2=67(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=219(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=196(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 141
LDI r2, 67
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 219
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 200
LDI r11, 196
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
