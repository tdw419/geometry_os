; DESCRIPTION: Composite: Places a orange 74x114 rectangle at position (281, 47) then Creates a cyan circular shape at (99, 178) with radius 76 then Places a purple line segment connecting (274, 236) to (509, 230).
; PLAN: r0=281(x), r1=47(y), r2=74(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=178(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x1), r11=236(y1), r12=509(x2), r13=230(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 47
LDI r2, 74
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 178
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 236
LDI r12, 509
LDI r13, 230
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
