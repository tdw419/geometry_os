; DESCRIPTION: Composite: Creates a green circular shape at (376, 111) with radius 60 then Creates a cyan rectangular region at (435, 121) spanning 44 by 13 pixels then Places a black line segment connecting (27, 136) to (322, 29).
; PLAN: r0=376(x), r1=111(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=121(y), r7=44(width), r8=13(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=27(x1), r11=136(y1), r12=322(x2), r13=29(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 111
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 121
LDI r7, 44
LDI r8, 13
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 136
LDI r12, 322
LDI r13, 29
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
