; DESCRIPTION: Composite: Draws a red rectangle at (237, 128) with width 100 and height 68 then Draws a green line from (186, 247) to (208, 136) then Renders a green disk with center (202, 155) and radius 57.
; PLAN: r0=237(x), r1=128(y), r2=100(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=247(y1), r7=208(x2), r8=136(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=155(y), r12=57(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 237
LDI r1, 128
LDI r2, 100
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 247
LDI r7, 208
LDI r8, 136
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 155
LDI r12, 57
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
