; DESCRIPTION: Composite: Places a yellow line segment connecting (367, 32) to (163, 221) then Creates a cyan circular shape at (457, 97) with radius 38 then Draws a white rectangle at (345, 126) with width 18 and height 119.
; PLAN: r0=367(x1), r1=32(y1), r2=163(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=97(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=126(y), r12=18(width), r13=119(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 32
LDI r2, 163
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 97
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 126
LDI r12, 18
LDI r13, 119
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
