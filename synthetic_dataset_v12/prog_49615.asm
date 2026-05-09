; DESCRIPTION: Composite: Sets a single white pixel at (49, 250) then Draws a yellow circle centered at (233, 79) with radius 77 then Renders a yellow box of size 111x83 starting at (283, 88).
; PLAN: r0=49(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=79(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=88(y), r12=111(width), r13=83(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 79
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 88
LDI r12, 111
LDI r13, 83
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
