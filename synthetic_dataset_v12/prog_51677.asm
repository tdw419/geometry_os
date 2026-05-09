; DESCRIPTION: Composite: Sets a single orange pixel at (432, 198) then Places a green circle of radius 48 at center (133, 65) then Places a green 48x49 rectangle at position (384, 188).
; PLAN: r0=432(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=65(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=188(y), r12=48(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 133
LDI r6, 65
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 188
LDI r12, 48
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
