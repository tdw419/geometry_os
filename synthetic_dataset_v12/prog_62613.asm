; DESCRIPTION: Composite: Renders a blue line between points (148, 175) and (493, 221) then Creates a black rectangular region at (360, 153) spanning 38 by 98 pixels then Creates a cyan circular shape at (398, 52) with radius 40.
; PLAN: r0=148(x1), r1=175(y1), r2=493(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=153(y), r7=38(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=52(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 175
LDI r2, 493
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 153
LDI r7, 38
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 52
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
