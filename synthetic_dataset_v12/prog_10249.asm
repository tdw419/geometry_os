; DESCRIPTION: Composite: Renders a blue disk with center (168, 152) and radius 68 then Creates a yellow rectangular region at (456, 176) spanning 39 by 35 pixels then Renders a black line between points (278, 120) and (331, 0).
; PLAN: r0=168(x), r1=152(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=176(y), r7=39(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x1), r11=120(y1), r12=331(x2), r13=0(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 152
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 176
LDI r7, 39
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 120
LDI r12, 331
LDI r13, 0
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
