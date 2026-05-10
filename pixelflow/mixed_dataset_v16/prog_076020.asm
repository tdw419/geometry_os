; DESCRIPTION: Composite: Creates a purple circular shape at (388, 209) with radius 21 then Places a orange 31x78 rectangle at position (264, 96) then Sets a single red pixel at (504, 67).
; PLAN: r0=388(x), r1=209(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=96(y), r7=31(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x), r11=67(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 209
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 96
LDI r7, 31
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 67
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
