; DESCRIPTION: Composite: Draws a white circle centered at (395, 211) with radius 33 then Renders a blue line between points (352, 113) and (102, 128) then Renders a orange box of size 33x81 starting at (141, 70).
; PLAN: r0=395(x), r1=211(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=113(y1), r7=102(x2), r8=128(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=70(y), r12=33(width), r13=81(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 211
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 113
LDI r7, 102
LDI r8, 128
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 70
LDI r12, 33
LDI r13, 81
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
