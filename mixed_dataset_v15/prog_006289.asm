; DESCRIPTION: Composite: Places a black 74x84 rectangle at position (123, 66) then Places a white circle of radius 62 at center (433, 92) then Renders a yellow line between points (427, 91) and (298, 138).
; PLAN: r0=123(x), r1=66(y), r2=74(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=92(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x1), r11=91(y1), r12=298(x2), r13=138(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 66
LDI r2, 74
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 92
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 91
LDI r12, 298
LDI r13, 138
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
