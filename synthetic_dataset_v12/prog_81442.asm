; DESCRIPTION: Composite: Creates a green circular shape at (436, 84) with radius 70 then Draws a white line from (299, 34) to (0, 31) then Draws a black rectangle at (117, 12) with width 42 and height 68.
; PLAN: r0=436(x), r1=84(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=34(y1), r7=0(x2), r8=31(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=12(y), r12=42(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 84
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 34
LDI r7, 0
LDI r8, 31
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 12
LDI r12, 42
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
