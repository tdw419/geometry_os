; DESCRIPTION: Composite: Draws a purple rectangle at (116, 166) with width 81 and height 25 then Renders a yellow line between points (76, 18) and (344, 64).
; PLAN: r0=116(x), r1=166(y), r2=81(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=18(y1), r7=344(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 166
LDI r2, 81
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 18
LDI r7, 344
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
