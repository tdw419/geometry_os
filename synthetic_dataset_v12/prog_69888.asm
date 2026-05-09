; DESCRIPTION: Composite: Places a white line segment connecting (13, 73) to (138, 38) then Draws a orange circle centered at (297, 90) with radius 67 then Draws a red rectangle at (66, 0) with width 60 and height 24.
; PLAN: r0=13(x1), r1=73(y1), r2=138(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=90(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=0(y), r12=60(width), r13=24(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 73
LDI r2, 138
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 90
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 0
LDI r12, 60
LDI r13, 24
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
