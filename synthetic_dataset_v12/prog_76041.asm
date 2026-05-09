; DESCRIPTION: Composite: Sets a single blue pixel at (122, 152) then Draws a white circle centered at (134, 160) with radius 44 then Places a black 14x71 rectangle at position (403, 65).
; PLAN: r0=122(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=160(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=65(y), r12=14(width), r13=71(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 160
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 65
LDI r12, 14
LDI r13, 71
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
