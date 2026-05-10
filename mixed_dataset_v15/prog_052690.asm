; DESCRIPTION: Composite: Renders a cyan disk with center (344, 235) and radius 16 then Creates a blue rectangular region at (126, 219) spanning 117 by 35 pixels then Places a green line segment connecting (492, 216) to (304, 69).
; PLAN: r0=344(x), r1=235(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=219(y), r7=117(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x1), r11=216(y1), r12=304(x2), r13=69(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 235
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 219
LDI r7, 117
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 216
LDI r12, 304
LDI r13, 69
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
