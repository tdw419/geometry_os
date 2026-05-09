; DESCRIPTION: Composite: Renders a red box of size 40x22 starting at (313, 52) then Renders a green disk with center (22, 64) and radius 16 then Renders a black line between points (268, 153) and (424, 211).
; PLAN: r0=313(x), r1=52(y), r2=40(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x), r6=64(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x1), r11=153(y1), r12=424(x2), r13=211(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 52
LDI r2, 40
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 64
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 153
LDI r12, 424
LDI r13, 211
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
