; DESCRIPTION: Composite: Renders a black disk with center (239, 129) and radius 37 then Places a magenta line segment connecting (173, 42) to (161, 84) then Draws a magenta rectangle at (176, 125) with width 16 and height 32.
; PLAN: r0=239(x), r1=129(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x1), r6=42(y1), r7=161(x2), r8=84(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=125(y), r12=16(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 129
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 42
LDI r7, 161
LDI r8, 84
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 125
LDI r12, 16
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
