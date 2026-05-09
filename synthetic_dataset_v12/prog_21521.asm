; DESCRIPTION: Composite: Creates a yellow rectangular region at (180, 130) spanning 64 by 100 pixels then Draws a yellow circle centered at (266, 127) with radius 55.
; PLAN: r0=180(x), r1=130(y), r2=64(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=127(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 130
LDI r2, 64
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 127
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
