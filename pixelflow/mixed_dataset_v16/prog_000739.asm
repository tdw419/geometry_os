; DESCRIPTION: Composite: Places a black line segment connecting (221, 33) to (40, 85) then Places a green 115x64 rectangle at position (194, 114) then Places a purple circle of radius 57 at center (241, 101).
; PLAN: r0=221(x1), r1=33(y1), r2=40(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=114(y), r7=115(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=101(y), r12=57(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 33
LDI r2, 40
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 114
LDI r7, 115
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 101
LDI r12, 57
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
