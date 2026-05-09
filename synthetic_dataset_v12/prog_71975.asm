; DESCRIPTION: Composite: Places a yellow dot at position (269, 56) then Renders a yellow disk with center (495, 28) and radius 14 then Draws a purple rectangle at (149, 135) with width 77 and height 81.
; PLAN: r0=269(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=495(x), r6=28(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=135(y), r12=77(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 495
LDI r6, 28
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 135
LDI r12, 77
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
