; DESCRIPTION: Composite: Places a blue dot at position (113, 180) then Places a purple 69x87 rectangle at position (400, 55) then Draws a green circle centered at (173, 96) with radius 16.
; PLAN: r0=113(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=55(y), r7=69(width), r8=87(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=96(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 55
LDI r7, 69
LDI r8, 87
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 96
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
