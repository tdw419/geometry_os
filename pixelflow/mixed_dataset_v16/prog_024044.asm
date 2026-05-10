; DESCRIPTION: Composite: Creates a magenta rectangular region at (291, 127) spanning 26 by 72 pixels then Renders a red disk with center (351, 93) and radius 69 then Places a blue line segment connecting (104, 129) to (326, 200).
; PLAN: r0=291(x), r1=127(y), r2=26(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x), r6=93(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x1), r11=129(y1), r12=326(x2), r13=200(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 127
LDI r2, 26
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 93
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 129
LDI r12, 326
LDI r13, 200
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
