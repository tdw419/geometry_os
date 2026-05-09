; DESCRIPTION: Composite: Places a cyan dot at position (70, 8) then Renders a red line between points (40, 88) and (350, 251) then Draws a black rectangle at (344, 83) with width 74 and height 86.
; PLAN: r0=70(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=88(y1), r7=350(x2), r8=251(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=83(y), r12=74(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 88
LDI r7, 350
LDI r8, 251
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 83
LDI r12, 74
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
