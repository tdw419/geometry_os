; DESCRIPTION: Composite: Places a cyan circle of radius 78 at center (228, 156) then Draws a yellow line from (47, 120) to (49, 222) then Draws a cyan rectangle at (47, 26) with width 86 and height 24.
; PLAN: r0=228(x), r1=156(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=120(y1), r7=49(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=26(y), r12=86(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 156
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 120
LDI r7, 49
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 26
LDI r12, 86
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
