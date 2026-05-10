; DESCRIPTION: Composite: Draws a magenta rectangle at (148, 186) with width 81 and height 34 then Creates a magenta circular shape at (75, 112) with radius 75 then Sets a single white pixel at (412, 177).
; PLAN: r0=148(x), r1=186(y), r2=81(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=112(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x), r11=177(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 186
LDI r2, 81
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 112
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 177
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
