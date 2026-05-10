; DESCRIPTION: Composite: Renders a blue line between points (305, 106) and (299, 78) then Renders a red box of size 79x64 starting at (167, 21) then Draws a white circle centered at (375, 106) with radius 21.
; PLAN: r0=305(x1), r1=106(y1), r2=299(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=21(y), r7=79(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=106(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 106
LDI r2, 299
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 21
LDI r7, 79
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 106
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
