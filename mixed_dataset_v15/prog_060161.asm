; DESCRIPTION: Composite: Renders a black box of size 110x15 starting at (234, 152) then Creates a blue circular shape at (456, 80) with radius 48 then Places a blue line segment connecting (103, 241) to (418, 224).
; PLAN: r0=234(x), r1=152(y), r2=110(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=80(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x1), r11=241(y1), r12=418(x2), r13=224(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 152
LDI r2, 110
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 80
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 241
LDI r12, 418
LDI r13, 224
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
