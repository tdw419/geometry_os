; DESCRIPTION: Composite: Renders a blue disk with center (470, 149) and radius 41 then Renders a magenta line between points (311, 218) and (164, 116) then Draws a cyan rectangle at (197, 122) with width 42 and height 52.
; PLAN: r0=470(x), r1=149(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=218(y1), r7=164(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=122(y), r12=42(width), r13=52(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 149
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 218
LDI r7, 164
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 122
LDI r12, 42
LDI r13, 52
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
