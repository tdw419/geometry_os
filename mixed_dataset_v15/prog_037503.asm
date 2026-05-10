; DESCRIPTION: Composite: Creates a white circular shape at (461, 106) with radius 14 then Sets a single white pixel at (226, 92) then Renders a yellow box of size 60x70 starting at (416, 22).
; PLAN: r0=461(x), r1=106(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=92(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=416(x), r11=22(y), r12=60(width), r13=70(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 106
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 92
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 416
LDI r11, 22
LDI r12, 60
LDI r13, 70
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
