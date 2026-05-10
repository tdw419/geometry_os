; DESCRIPTION: Composite: Creates a cyan circular shape at (217, 215) with radius 22 then Draws a magenta rectangle at (190, 66) with width 74 and height 118 then Renders a orange line between points (203, 248) and (3, 47).
; PLAN: r0=217(x), r1=215(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=66(y), r7=74(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=248(y1), r12=3(x2), r13=47(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 215
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 66
LDI r7, 74
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 248
LDI r12, 3
LDI r13, 47
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
