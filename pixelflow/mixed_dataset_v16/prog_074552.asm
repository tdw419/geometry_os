; DESCRIPTION: Composite: Sets a single orange pixel at (363, 230) then Places a black circle of radius 20 at center (436, 180) then Creates a blue rectangular region at (42, 124) spanning 67 by 101 pixels.
; PLAN: r0=363(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=180(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=124(y), r12=67(width), r13=101(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 436
LDI r6, 180
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 124
LDI r12, 67
LDI r13, 101
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
