; DESCRIPTION: Composite: Creates a orange circular shape at (253, 64) with radius 46 then Places a cyan 15x44 rectangle at position (469, 86) then Renders a white line between points (360, 147) and (17, 157).
; PLAN: r0=253(x), r1=64(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=86(y), r7=15(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x1), r11=147(y1), r12=17(x2), r13=157(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 64
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 86
LDI r7, 15
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 147
LDI r12, 17
LDI r13, 157
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
