; DESCRIPTION: Composite: Places a orange line segment connecting (390, 242) to (360, 121) then Draws a white circle centered at (351, 113) with radius 24.
; PLAN: r0=390(x1), r1=242(y1), r2=360(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=113(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 390
LDI r1, 242
LDI r2, 360
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 113
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
