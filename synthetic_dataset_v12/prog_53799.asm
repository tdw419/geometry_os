; DESCRIPTION: Composite: Renders a green disk with center (361, 151) and radius 74 then Renders a purple line between points (471, 90) and (335, 114) then Draws a magenta rectangle at (35, 50) with width 50 and height 117.
; PLAN: r0=361(x), r1=151(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x1), r6=90(y1), r7=335(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=50(y), r12=50(width), r13=117(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 151
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 90
LDI r7, 335
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 50
LDI r12, 50
LDI r13, 117
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
