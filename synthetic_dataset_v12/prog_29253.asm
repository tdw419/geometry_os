; DESCRIPTION: Composite: Draws a magenta rectangle at (222, 138) with width 49 and height 117 then Renders a black line between points (504, 58) and (259, 56) then Places a purple dot at position (330, 173).
; PLAN: r0=222(x), r1=138(y), r2=49(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x1), r6=58(y1), r7=259(x2), r8=56(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=173(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 138
LDI r2, 49
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 58
LDI r7, 259
LDI r8, 56
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 173
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
