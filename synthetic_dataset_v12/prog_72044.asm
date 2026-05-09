; DESCRIPTION: Composite: Places a cyan 14x59 rectangle at position (183, 76) then Places a orange dot at position (81, 17) then Places a yellow line segment connecting (360, 138) to (344, 189).
; PLAN: r0=183(x), r1=76(y), r2=14(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=17(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=360(x1), r11=138(y1), r12=344(x2), r13=189(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 76
LDI r2, 14
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 17
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 360
LDI r11, 138
LDI r12, 344
LDI r13, 189
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
