; DESCRIPTION: Composite: Creates a white rectangular region at (166, 20) spanning 71 by 113 pixels then Draws a white circle centered at (51, 112) with radius 46.
; PLAN: r0=166(x), r1=20(y), r2=71(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=112(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 166
LDI r1, 20
LDI r2, 71
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 112
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
