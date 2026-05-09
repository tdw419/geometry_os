; DESCRIPTION: Composite: Renders a purple disk with center (310, 163) and radius 69 then Sets a single green pixel at (364, 184) then Renders a white box of size 57x16 starting at (148, 132).
; PLAN: r0=310(x), r1=163(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=184(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=132(y), r12=57(width), r13=16(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 163
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 184
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 148
LDI r11, 132
LDI r12, 57
LDI r13, 16
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
