; DESCRIPTION: Composite: Draws a blue circle centered at (151, 77) with radius 62 then Renders a cyan line between points (386, 249) and (368, 23) then Creates a purple rectangular region at (351, 51) spanning 111 by 24 pixels.
; PLAN: r0=151(x), r1=77(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=249(y1), r7=368(x2), r8=23(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=51(y), r12=111(width), r13=24(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 77
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 249
LDI r7, 368
LDI r8, 23
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 51
LDI r12, 111
LDI r13, 24
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
