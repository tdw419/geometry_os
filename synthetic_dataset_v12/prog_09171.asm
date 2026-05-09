; DESCRIPTION: Composite: Places a orange dot at position (176, 30) then Creates a magenta circular shape at (278, 90) with radius 20 then Places a cyan 60x104 rectangle at position (323, 121).
; PLAN: r0=176(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=90(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x), r11=121(y), r12=60(width), r13=104(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 278
LDI r6, 90
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 121
LDI r12, 60
LDI r13, 104
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
