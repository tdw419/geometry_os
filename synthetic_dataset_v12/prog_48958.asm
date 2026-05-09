; DESCRIPTION: Composite: Draws a cyan rectangle at (75, 26) with width 89 and height 62 then Draws a yellow circle centered at (114, 124) with radius 28 then Draws a black line from (394, 62) to (29, 128).
; PLAN: r0=75(x), r1=26(y), r2=89(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=124(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=62(y1), r12=29(x2), r13=128(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 26
LDI r2, 89
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 124
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 62
LDI r12, 29
LDI r13, 128
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
