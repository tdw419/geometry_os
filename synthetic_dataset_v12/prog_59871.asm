; DESCRIPTION: Composite: Creates a black rectangular region at (287, 69) spanning 12 by 93 pixels then Renders a cyan disk with center (182, 164) and radius 76 then Places a blue line segment connecting (444, 155) to (251, 178).
; PLAN: r0=287(x), r1=69(y), r2=12(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=164(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=444(x1), r11=155(y1), r12=251(x2), r13=178(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 69
LDI r2, 12
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 164
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 444
LDI r11, 155
LDI r12, 251
LDI r13, 178
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
