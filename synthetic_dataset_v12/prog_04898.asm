; DESCRIPTION: Composite: Renders a white box of size 103x64 starting at (54, 134) then Places a green circle of radius 70 at center (337, 149) then Renders a red line between points (172, 162) and (23, 129).
; PLAN: r0=54(x), r1=134(y), r2=103(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=149(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=162(y1), r12=23(x2), r13=129(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 134
LDI r2, 103
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 149
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 162
LDI r12, 23
LDI r13, 129
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
