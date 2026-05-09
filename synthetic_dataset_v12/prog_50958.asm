; DESCRIPTION: Composite: Draws a cyan circle centered at (481, 79) with radius 12 then Sets a single white pixel at (484, 171) then Creates a green rectangular region at (264, 130) spanning 111 by 20 pixels.
; PLAN: r0=481(x), r1=79(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=171(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=130(y), r12=111(width), r13=20(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 79
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 171
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 130
LDI r12, 111
LDI r13, 20
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
