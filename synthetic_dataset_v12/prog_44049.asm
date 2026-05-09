; DESCRIPTION: Composite: Draws a orange circle centered at (58, 164) with radius 44 then Renders a white line between points (280, 72) and (192, 239) then Creates a orange rectangular region at (99, 102) spanning 116 by 32 pixels.
; PLAN: r0=58(x), r1=164(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x1), r6=72(y1), r7=192(x2), r8=239(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=102(y), r12=116(width), r13=32(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 164
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 72
LDI r7, 192
LDI r8, 239
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 102
LDI r12, 116
LDI r13, 32
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
