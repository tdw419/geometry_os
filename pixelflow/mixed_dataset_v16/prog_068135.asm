; DESCRIPTION: Composite: Draws a orange circle centered at (293, 72) with radius 67 then Places a green line segment connecting (58, 129) to (384, 80) then Draws a white rectangle at (252, 80) with width 14 and height 14.
; PLAN: r0=293(x), r1=72(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=129(y1), r7=384(x2), r8=80(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=80(y), r12=14(width), r13=14(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 72
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 129
LDI r7, 384
LDI r8, 80
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 80
LDI r12, 14
LDI r13, 14
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
