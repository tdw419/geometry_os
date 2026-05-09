; DESCRIPTION: Composite: Renders a blue line between points (385, 128) and (476, 220) then Creates a cyan rectangular region at (173, 171) spanning 46 by 68 pixels then Renders a blue disk with center (134, 148) and radius 61.
; PLAN: r0=385(x1), r1=128(y1), r2=476(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=171(y), r7=46(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=148(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 128
LDI r2, 476
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 171
LDI r7, 46
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 148
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
