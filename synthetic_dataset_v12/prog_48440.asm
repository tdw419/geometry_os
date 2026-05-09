; DESCRIPTION: Composite: Renders a cyan line between points (336, 172) and (88, 220) then Places a green dot at position (396, 169) then Draws a magenta rectangle at (156, 73) with width 71 and height 40.
; PLAN: r0=336(x1), r1=172(y1), r2=88(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=73(y), r12=71(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 172
LDI r2, 88
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 156
LDI r11, 73
LDI r12, 71
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
