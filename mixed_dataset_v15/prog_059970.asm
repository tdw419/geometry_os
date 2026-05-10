; DESCRIPTION: Composite: Draws a cyan circle centered at (352, 104) with radius 65 then Draws a white rectangle at (465, 188) with width 24 and height 19 then Renders a red line between points (105, 98) and (176, 182).
; PLAN: r0=352(x), r1=104(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=188(y), r7=24(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x1), r11=98(y1), r12=176(x2), r13=182(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 104
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 188
LDI r7, 24
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 98
LDI r12, 176
LDI r13, 182
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
