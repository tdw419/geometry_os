; DESCRIPTION: Composite: Renders a cyan line between points (96, 41) and (490, 217) then Renders a orange disk with center (431, 149) and radius 54 then Places a white 30x101 rectangle at position (231, 49).
; PLAN: r0=96(x1), r1=41(y1), r2=490(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=149(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=49(y), r12=30(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 41
LDI r2, 490
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 149
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 49
LDI r12, 30
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
