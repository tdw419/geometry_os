; DESCRIPTION: Composite: Renders a white line between points (507, 105) and (3, 88) then Creates a green circular shape at (380, 165) with radius 54 then Renders a white box of size 92x18 starting at (400, 132).
; PLAN: r0=507(x1), r1=105(y1), r2=3(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=165(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=132(y), r12=92(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 105
LDI r2, 3
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 165
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 132
LDI r12, 92
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
