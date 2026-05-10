; DESCRIPTION: Composite: Draws a yellow line from (21, 66) to (107, 108) then Renders a yellow box of size 63x71 starting at (176, 92) then Places a red circle of radius 47 at center (311, 93).
; PLAN: r0=21(x1), r1=66(y1), r2=107(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=92(y), r7=63(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=93(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 66
LDI r2, 107
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 92
LDI r7, 63
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 93
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
