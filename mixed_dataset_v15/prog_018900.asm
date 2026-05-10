; DESCRIPTION: Composite: Draws a black line from (315, 185) to (164, 135) then Draws a green circle centered at (456, 184) with radius 30 then Renders a cyan box of size 78x62 starting at (200, 94).
; PLAN: r0=315(x1), r1=185(y1), r2=164(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=184(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=94(y), r12=78(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 185
LDI r2, 164
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 184
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 94
LDI r12, 78
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
