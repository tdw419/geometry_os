; DESCRIPTION: Composite: Places a yellow 120x81 rectangle at position (370, 19) then Creates a white circular shape at (468, 166) with radius 29 then Draws a black line from (76, 94) to (71, 166).
; PLAN: r0=370(x), r1=19(y), r2=120(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=166(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x1), r11=94(y1), r12=71(x2), r13=166(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 19
LDI r2, 120
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 166
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 94
LDI r12, 71
LDI r13, 166
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
