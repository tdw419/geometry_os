; DESCRIPTION: Composite: Creates a orange circular shape at (155, 204) with radius 14 then Places a magenta line segment connecting (42, 255) to (215, 140) then Draws a blue rectangle at (132, 9) with width 115 and height 64.
; PLAN: r0=155(x), r1=204(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=255(y1), r7=215(x2), r8=140(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=9(y), r12=115(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 204
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 255
LDI r7, 215
LDI r8, 140
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 9
LDI r12, 115
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
