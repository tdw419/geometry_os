; DESCRIPTION: Composite: Renders a cyan line between points (27, 164) and (63, 123) then Places a magenta 108x20 rectangle at position (197, 143) then Places a blue circle of radius 40 at center (143, 135).
; PLAN: r0=27(x1), r1=164(y1), r2=63(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=143(y), r7=108(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x), r11=135(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 164
LDI r2, 63
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 143
LDI r7, 108
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 135
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
