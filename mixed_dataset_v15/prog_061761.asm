; DESCRIPTION: Composite: Sets a single white pixel at (431, 137) then Places a green circle of radius 60 at center (122, 135) then Renders a orange box of size 118x112 starting at (271, 25).
; PLAN: r0=431(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=135(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=25(y), r12=118(width), r13=112(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 135
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 25
LDI r12, 118
LDI r13, 112
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
