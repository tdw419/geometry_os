; DESCRIPTION: Composite: Sets a single green pixel at (374, 230) then Creates a orange circular shape at (319, 168) with radius 30 then Places a purple 73x21 rectangle at position (360, 202).
; PLAN: r0=374(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=168(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=202(y), r12=73(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 319
LDI r6, 168
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 202
LDI r12, 73
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
