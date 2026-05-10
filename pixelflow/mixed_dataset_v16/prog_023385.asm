; DESCRIPTION: Composite: Renders a blue disk with center (388, 76) and radius 73 then Places a yellow line segment connecting (148, 111) to (321, 211) then Creates a red rectangular region at (379, 200) spanning 72 by 30 pixels.
; PLAN: r0=388(x), r1=76(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=111(y1), r7=321(x2), r8=211(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=200(y), r12=72(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 76
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 111
LDI r7, 321
LDI r8, 211
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 200
LDI r12, 72
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
