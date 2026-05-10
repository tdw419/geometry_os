; DESCRIPTION: Composite: Creates a black circular shape at (247, 154) with radius 73 then Renders a orange line between points (191, 165) and (437, 249) then Places a blue 37x35 rectangle at position (121, 183).
; PLAN: r0=247(x), r1=154(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=165(y1), r7=437(x2), r8=249(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=183(y), r12=37(width), r13=35(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 154
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 165
LDI r7, 437
LDI r8, 249
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 183
LDI r12, 37
LDI r13, 35
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
