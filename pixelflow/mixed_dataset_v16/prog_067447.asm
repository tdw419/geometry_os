; DESCRIPTION: Composite: Places a green dot at position (199, 222) then Draws a magenta rectangle at (421, 60) with width 88 and height 86 then Renders a magenta line between points (78, 248) and (474, 49).
; PLAN: r0=199(x), r1=222(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=60(y), r7=88(width), r8=86(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x1), r11=248(y1), r12=474(x2), r13=49(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 222
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 60
LDI r7, 88
LDI r8, 86
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 248
LDI r12, 474
LDI r13, 49
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
