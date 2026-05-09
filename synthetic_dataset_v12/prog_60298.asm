; DESCRIPTION: Composite: Creates a blue circular shape at (317, 136) with radius 53 then Places a green dot at position (38, 224) then Places a white line segment connecting (360, 96) to (176, 152).
; PLAN: r0=317(x), r1=136(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=224(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=360(x1), r11=96(y1), r12=176(x2), r13=152(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 136
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 224
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 360
LDI r11, 96
LDI r12, 176
LDI r13, 152
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
