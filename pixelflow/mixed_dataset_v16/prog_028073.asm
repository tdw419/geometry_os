; DESCRIPTION: Composite: Sets a single blue pixel at (242, 19) then Creates a yellow circular shape at (416, 91) with radius 77 then Draws a white rectangle at (349, 47) with width 37 and height 115.
; PLAN: r0=242(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=91(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=349(x), r11=47(y), r12=37(width), r13=115(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 91
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 349
LDI r11, 47
LDI r12, 37
LDI r13, 115
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
