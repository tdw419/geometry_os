; DESCRIPTION: Composite: Renders a red disk with center (329, 63) and radius 44 then Places a yellow line segment connecting (499, 16) to (43, 49) then Places a black 98x62 rectangle at position (311, 151).
; PLAN: r0=329(x), r1=63(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x1), r6=16(y1), r7=43(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=151(y), r12=98(width), r13=62(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 63
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 16
LDI r7, 43
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 151
LDI r12, 98
LDI r13, 62
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
