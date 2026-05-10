; DESCRIPTION: Composite: Places a white line segment connecting (419, 205) to (252, 96) then Renders a white disk with center (69, 158) and radius 20 then Places a yellow 46x73 rectangle at position (27, 46).
; PLAN: r0=419(x1), r1=205(y1), r2=252(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=158(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=46(y), r12=46(width), r13=73(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 205
LDI r2, 252
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 158
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 46
LDI r12, 46
LDI r13, 73
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
