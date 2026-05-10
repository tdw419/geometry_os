; DESCRIPTION: Composite: Places a magenta dot at position (431, 188) then Renders a yellow line between points (437, 136) and (243, 164) then Draws a green rectangle at (359, 40) with width 27 and height 101.
; PLAN: r0=431(x), r1=188(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=136(y1), r7=243(x2), r8=164(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=40(y), r12=27(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 188
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 136
LDI r7, 243
LDI r8, 164
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 40
LDI r12, 27
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
