; DESCRIPTION: Composite: Sets a single red pixel at (364, 153) then Draws a green circle centered at (93, 138) with radius 40 then Creates a blue rectangular region at (388, 151) spanning 54 by 34 pixels.
; PLAN: r0=364(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=138(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=151(y), r12=54(width), r13=34(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 138
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 151
LDI r12, 54
LDI r13, 34
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
