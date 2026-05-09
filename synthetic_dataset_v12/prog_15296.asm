; DESCRIPTION: Composite: Renders a yellow line between points (386, 141) and (362, 173) then Draws a black circle centered at (474, 121) with radius 13 then Places a purple 56x65 rectangle at position (325, 70).
; PLAN: r0=386(x1), r1=141(y1), r2=362(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=121(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=70(y), r12=56(width), r13=65(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 141
LDI r2, 362
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 121
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 70
LDI r12, 56
LDI r13, 65
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
