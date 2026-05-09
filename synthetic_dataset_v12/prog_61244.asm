; DESCRIPTION: Composite: Sets a single purple pixel at (163, 57) then Renders a green line between points (354, 158) and (359, 241) then Draws a blue rectangle at (50, 192) with width 78 and height 36.
; PLAN: r0=163(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=158(y1), r7=359(x2), r8=241(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=192(y), r12=78(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 57
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 158
LDI r7, 359
LDI r8, 241
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 192
LDI r12, 78
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
