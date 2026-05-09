; DESCRIPTION: Composite: Renders a green disk with center (232, 80) and radius 78 then Renders a orange box of size 28x14 starting at (140, 184) then Draws a white line from (111, 117) to (47, 75).
; PLAN: r0=232(x), r1=80(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=184(y), r7=28(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=117(y1), r12=47(x2), r13=75(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 80
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 184
LDI r7, 28
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 117
LDI r12, 47
LDI r13, 75
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
