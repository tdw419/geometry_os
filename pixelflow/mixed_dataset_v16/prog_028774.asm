; DESCRIPTION: Composite: Places a green line segment connecting (273, 209) to (305, 188) then Creates a yellow circular shape at (117, 54) with radius 49 then Draws a black rectangle at (236, 102) with width 82 and height 67.
; PLAN: r0=273(x1), r1=209(y1), r2=305(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=54(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x), r11=102(y), r12=82(width), r13=67(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 209
LDI r2, 305
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 54
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 102
LDI r12, 82
LDI r13, 67
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
