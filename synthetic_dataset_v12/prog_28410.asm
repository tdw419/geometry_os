; DESCRIPTION: Composite: Sets a single white pixel at (78, 143) then Draws a white circle centered at (217, 140) with radius 60 then Creates a yellow rectangular region at (177, 152) spanning 80 by 87 pixels.
; PLAN: r0=78(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=140(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=152(y), r12=80(width), r13=87(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 140
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 152
LDI r12, 80
LDI r13, 87
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
