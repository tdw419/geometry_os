; DESCRIPTION: Composite: Renders a purple line between points (400, 159) and (500, 19) then Creates a red circular shape at (231, 206) with radius 27 then Renders a orange box of size 45x83 starting at (432, 53).
; PLAN: r0=400(x1), r1=159(y1), r2=500(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=206(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x), r11=53(y), r12=45(width), r13=83(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 159
LDI r2, 500
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 206
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 53
LDI r12, 45
LDI r13, 83
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
