; DESCRIPTION: Composite: Sets a single purple pixel at (415, 116) then Renders a purple disk with center (327, 65) and radius 37 then Creates a blue rectangular region at (441, 100) spanning 30 by 69 pixels.
; PLAN: r0=415(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=65(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=100(y), r12=30(width), r13=69(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 65
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 100
LDI r12, 30
LDI r13, 69
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
