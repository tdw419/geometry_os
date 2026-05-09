; DESCRIPTION: Composite: Sets a single blue pixel at (487, 139) then Places a magenta circle of radius 34 at center (192, 202) then Creates a purple rectangular region at (153, 84) spanning 103 by 110 pixels.
; PLAN: r0=487(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=202(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=84(y), r12=103(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 202
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 84
LDI r12, 103
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
