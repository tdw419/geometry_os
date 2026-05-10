; DESCRIPTION: Composite: Draws a purple circle centered at (89, 173) with radius 79 then Draws a red rectangle at (183, 104) with width 78 and height 73 then Renders a cyan line between points (218, 74) and (86, 187).
; PLAN: r0=89(x), r1=173(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=104(y), r7=78(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x1), r11=74(y1), r12=86(x2), r13=187(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 173
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 104
LDI r7, 78
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 74
LDI r12, 86
LDI r13, 187
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
