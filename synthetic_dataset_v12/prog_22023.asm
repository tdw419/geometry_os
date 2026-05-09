; DESCRIPTION: Composite: Places a green line segment connecting (36, 61) to (381, 157) then Places a white circle of radius 38 at center (410, 149) then Draws a magenta rectangle at (144, 23) with width 120 and height 50.
; PLAN: r0=36(x1), r1=61(y1), r2=381(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=149(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x), r11=23(y), r12=120(width), r13=50(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 61
LDI r2, 381
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 149
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 23
LDI r12, 120
LDI r13, 50
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
