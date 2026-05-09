; DESCRIPTION: Composite: Renders a cyan box of size 90x35 starting at (390, 194) then Creates a white circular shape at (361, 200) with radius 52 then Places a blue line segment connecting (238, 97) to (338, 136).
; PLAN: r0=390(x), r1=194(y), r2=90(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=200(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=97(y1), r12=338(x2), r13=136(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 194
LDI r2, 90
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 200
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 97
LDI r12, 338
LDI r13, 136
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
