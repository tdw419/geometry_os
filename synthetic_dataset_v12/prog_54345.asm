; DESCRIPTION: Composite: Draws a blue circle centered at (387, 107) with radius 55 then Sets a single black pixel at (369, 32) then Renders a red box of size 113x81 starting at (259, 129).
; PLAN: r0=387(x), r1=107(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=32(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=129(y), r12=113(width), r13=81(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 107
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 32
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 259
LDI r11, 129
LDI r12, 113
LDI r13, 81
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
