; DESCRIPTION: Composite: Draws a black circle centered at (360, 170) with radius 11 then Draws a green line from (14, 38) to (204, 202) then Places a orange 50x112 rectangle at position (67, 141).
; PLAN: r0=360(x), r1=170(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=38(y1), r7=204(x2), r8=202(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=141(y), r12=50(width), r13=112(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 170
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 38
LDI r7, 204
LDI r8, 202
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 141
LDI r12, 50
LDI r13, 112
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
