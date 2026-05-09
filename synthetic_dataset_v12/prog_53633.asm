; DESCRIPTION: Composite: Sets a single yellow pixel at (442, 233) then Places a green circle of radius 46 at center (203, 95) then Places a purple 90x78 rectangle at position (385, 146).
; PLAN: r0=442(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=95(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=146(y), r12=90(width), r13=78(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 442
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 203
LDI r6, 95
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 146
LDI r12, 90
LDI r13, 78
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
