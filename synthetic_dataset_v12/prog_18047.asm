; DESCRIPTION: Composite: Creates a yellow circular shape at (137, 124) with radius 72 then Places a green 46x88 rectangle at position (458, 109) then Renders a blue line between points (237, 150) and (11, 5).
; PLAN: r0=137(x), r1=124(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x), r6=109(y), r7=46(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=237(x1), r11=150(y1), r12=11(x2), r13=5(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 124
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 109
LDI r7, 46
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 150
LDI r12, 11
LDI r13, 5
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
