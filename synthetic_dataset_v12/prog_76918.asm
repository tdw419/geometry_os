; DESCRIPTION: Composite: Draws a red circle centered at (175, 177) with radius 32 then Places a white line segment connecting (231, 156) to (255, 195) then Creates a blue rectangular region at (409, 36) spanning 44 by 119 pixels.
; PLAN: r0=175(x), r1=177(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x1), r6=156(y1), r7=255(x2), r8=195(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=36(y), r12=44(width), r13=119(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 177
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 156
LDI r7, 255
LDI r8, 195
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 36
LDI r12, 44
LDI r13, 119
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
