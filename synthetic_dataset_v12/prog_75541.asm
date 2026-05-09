; DESCRIPTION: Composite: Creates a green rectangular region at (17, 81) spanning 62 by 75 pixels then Places a white circle of radius 42 at center (352, 197) then Renders a blue line between points (347, 37) and (216, 67).
; PLAN: r0=17(x), r1=81(y), r2=62(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=197(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x1), r11=37(y1), r12=216(x2), r13=67(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 81
LDI r2, 62
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 197
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 37
LDI r12, 216
LDI r13, 67
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
