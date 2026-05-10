; DESCRIPTION: Composite: Creates a blue circular shape at (153, 112) with radius 76 then Places a orange 30x64 rectangle at position (148, 141) then Renders a black line between points (214, 148) and (239, 203).
; PLAN: r0=153(x), r1=112(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=141(y), r7=30(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x1), r11=148(y1), r12=239(x2), r13=203(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 112
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 141
LDI r7, 30
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 148
LDI r12, 239
LDI r13, 203
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
