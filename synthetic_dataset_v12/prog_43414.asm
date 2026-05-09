; DESCRIPTION: Composite: Places a blue 49x42 rectangle at position (154, 141) then Draws a purple circle centered at (205, 191) with radius 29 then Renders a cyan line between points (492, 140) and (433, 65).
; PLAN: r0=154(x), r1=141(y), r2=49(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=191(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x1), r11=140(y1), r12=433(x2), r13=65(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 141
LDI r2, 49
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 191
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 140
LDI r12, 433
LDI r13, 65
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
