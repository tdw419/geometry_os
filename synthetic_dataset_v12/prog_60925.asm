; DESCRIPTION: Composite: Places a cyan 25x114 rectangle at position (83, 4) then Draws a yellow circle centered at (260, 184) with radius 40 then Places a black line segment connecting (1, 103) to (212, 98).
; PLAN: r0=83(x), r1=4(y), r2=25(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=184(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x1), r11=103(y1), r12=212(x2), r13=98(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 4
LDI r2, 25
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 184
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 103
LDI r12, 212
LDI r13, 98
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
