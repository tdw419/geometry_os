; DESCRIPTION: Composite: Renders a black box of size 81x83 starting at (344, 0) then Draws a yellow line from (239, 26) to (369, 11).
; PLAN: r0=344(x), r1=0(y), r2=81(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=26(y1), r7=369(x2), r8=11(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 0
LDI r2, 81
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 26
LDI r7, 369
LDI r8, 11
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
