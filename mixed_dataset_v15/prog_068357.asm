; DESCRIPTION: Composite: Places a red 36x22 rectangle at position (92, 185) then Creates a cyan circular shape at (159, 200) with radius 41 then Renders a black line between points (399, 78) and (501, 134).
; PLAN: r0=92(x), r1=185(y), r2=36(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=200(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x1), r11=78(y1), r12=501(x2), r13=134(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 185
LDI r2, 36
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 200
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 78
LDI r12, 501
LDI r13, 134
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
