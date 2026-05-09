; DESCRIPTION: Composite: Places a black line segment connecting (463, 54) to (497, 82) then Places a cyan circle of radius 40 at center (99, 115) then Draws a black rectangle at (231, 152) with width 13 and height 34.
; PLAN: r0=463(x1), r1=54(y1), r2=497(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=115(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=152(y), r12=13(width), r13=34(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 54
LDI r2, 497
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 115
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 152
LDI r12, 13
LDI r13, 34
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
