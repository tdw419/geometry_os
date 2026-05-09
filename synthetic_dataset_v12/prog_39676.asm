; DESCRIPTION: Composite: Creates a yellow circular shape at (122, 102) with radius 55 then Places a red 65x70 rectangle at position (103, 149) then Renders a magenta line between points (3, 126) and (202, 5).
; PLAN: r0=122(x), r1=102(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=149(y), r7=65(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=3(x1), r11=126(y1), r12=202(x2), r13=5(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 102
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 149
LDI r7, 65
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 126
LDI r12, 202
LDI r13, 5
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
