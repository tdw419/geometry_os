; DESCRIPTION: Composite: Creates a blue circular shape at (85, 167) with radius 66 then Places a purple 24x65 rectangle at position (201, 99) then Places a cyan line segment connecting (346, 62) to (120, 201).
; PLAN: r0=85(x), r1=167(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=99(y), r7=24(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=62(y1), r12=120(x2), r13=201(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 167
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 99
LDI r7, 24
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 62
LDI r12, 120
LDI r13, 201
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
