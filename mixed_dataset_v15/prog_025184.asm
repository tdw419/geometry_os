; DESCRIPTION: Composite: Places a black line segment connecting (133, 58) to (204, 42) then Creates a cyan circular shape at (305, 69) with radius 23 then Places a orange 117x86 rectangle at position (256, 75).
; PLAN: r0=133(x1), r1=58(y1), r2=204(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=69(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=75(y), r12=117(width), r13=86(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 58
LDI r2, 204
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 69
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 75
LDI r12, 117
LDI r13, 86
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
