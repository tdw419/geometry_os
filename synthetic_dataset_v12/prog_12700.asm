; DESCRIPTION: Composite: Renders a yellow disk with center (360, 181) and radius 60 then Sets a single white pixel at (163, 151) then Renders a purple box of size 105x88 starting at (21, 111).
; PLAN: r0=360(x), r1=181(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=151(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=21(x), r11=111(y), r12=105(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 181
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 151
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 21
LDI r11, 111
LDI r12, 105
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
